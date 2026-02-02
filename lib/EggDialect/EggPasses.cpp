// EggPasses.cpp - Implements the Egg dialect passes.
#include "EggDialect/EggDialect.h"
#include "EggDialect/EggOps.h"
#include "EggDialect/EggSaturation.h"
#include "EggDialect/NeuraToSExpr.h"
#include "EggDialect/RewriteRules.h"
#include "EggDialect/SExprToNeura.h"
#include "NeuraDialect/NeuraDialect.h"
#include "NeuraDialect/NeuraOps.h"

#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Pass/Pass.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/Support/raw_ostream.h"

#include <queue>
#include <set>
#include <map>

namespace mlir {
namespace egg {

#define GEN_PASS_DECL_PROCESSNEURA
#define GEN_PASS_DEF_PROCESSNEURA
#include "EggDialect/EggPasses.h.inc"

namespace {

/// Represents a group of operations to be fused into a single FusedOp.
struct FusionGroup {
  std::string patternName;
  Operation* rootOp;
  std::vector<Operation*> opsInGroup;
  SmallVector<Value> externalInputs;
  SmallVector<Value> externalOutputs;
  int64_t frequency;
  size_t rootIndex;
};

struct ProcessNeuraPass : public impl::ProcessNeuraBase<ProcessNeuraPass> {
  using impl::ProcessNeuraBase<ProcessNeuraPass>::ProcessNeuraBase;

  /// Executes the egg-process-neura pass on the module.
  void runOnOperation() override {
    ModuleOp module = getOperation();

    std::string area_spec_file = getAreaSpecFile();
    if (area_spec_file.empty()) {
      area_spec_file = areaSpecFile;
    }

    if (area_spec_file.empty()) {
      llvm::errs() << "Error: --area-spec is required for egg-process-neura pass.\n";
      signalPassFailure();
      return;
    }

    AreaMap areaMap;
    if (!parseAreaSpecFile(area_spec_file, areaMap)) {
      llvm::errs() << "Error: Failed to parse area spec file: " << area_spec_file << "\n";
      signalPassFailure();
      return;
    }
    
    // Collects Neura operations and converts them to S-expressions.
    NeuraToSExpr converter;
    std::vector<std::string> all_seprs;
    std::vector<Operation*> neura_ops;

    module.walk([&](Operation *op) {
      if (op->getDialect() && op->getDialect()->getNamespace() == "neura") {
        if (!op->use_empty()) {
          return;
        }
        std::string sexpr = converter.convert(op);
        if (!sexpr.empty()) {
          all_seprs.push_back(sexpr);
          neura_ops.push_back(op);
        }
      }
    });

    // Extracts patterns and generates rewrite rules.
    auto patterns = RewriteRuleGenerator::extractPatterns(all_seprs, areaMap, minPatternFrequency, maxPatternArea, maxPatternOps);
    auto fusionRules = RewriteRuleGenerator::generateFusionRulesFromPatterns(patterns);
    
    std::vector<RewriteRule> allRules;
    allRules.insert(allRules.end(), fusionRules.begin(), fusionRules.end());
    
    // Note: Algebraic, commutativity, and associativity rules are disabled
    // because egg's pattern syntax doesn't support numeric literals directly.
    // TODO: Enable these rules once the pattern format is compatible.
    // auto algebraicRules = RewriteRuleGenerator::getAlgebraicIdentityRules();
    // auto commutativityRules = RewriteRuleGenerator::getCommutativityRules();
    // auto associativityRules = RewriteRuleGenerator::getAssociativityRules();
    // allRules.insert(allRules.end(), algebraicRules.begin(), algebraicRules.end());
    // allRules.insert(allRules.end(), commutativityRules.begin(), commutativityRules.end());
    // allRules.insert(allRules.end(), associativityRules.begin(), associativityRules.end());

    // Builds fused pattern info map.
    llvm::StringMap<FusedPatternInfo> fused_pattern_map;
    for (const auto& pattern : patterns) {
      std::string fused_name;
      for (size_t idx = 0; idx < pattern.operators.size(); ++idx) {
        if (idx > 0) fused_name += "_";
        fused_name += pattern.operators[idx];
      }
      FusedPatternInfo info;
      info.patternName = fused_name;
      info.originalPattern = pattern.pattern;
      info.frequency = pattern.frequency;
      info.operators = pattern.operators;
      fused_pattern_map[fused_name] = info;
    }
    
    // Runs equality saturation on each S-expression.
    EggConfig config;
    config.iterLimit = 30;
    config.nodeLimit = 10000;
    config.timeLimitSecs = 60;
    
    std::vector<std::string> optimized_exprs;
    for (size_t i = 0; i < all_seprs.size(); ++i) {
      CycleAwareSaturationResult result = runCycleAwareSaturation(all_seprs[i], allRules, areaMap, config);
      if (result.isSuccess()) {
        optimized_exprs.push_back(result.resultExpr);
      } else {
        optimized_exprs.push_back(all_seprs[i]);
      }
    }

    // Identifies fusion groups from optimized expressions.
    std::vector<FusionGroup> fusion_groups;
    for (size_t i = 0; i < neura_ops.size() && i < optimized_exprs.size(); ++i) {
      if (!neura_ops[i]) continue;

      size_t fused_pos = optimized_exprs[i].find("(fused ");
      if (fused_pos == std::string::npos) {
        continue;
      }

      size_t name_start = fused_pos + 7;
      size_t name_end = optimized_exprs[i].find_first_of(" )", name_start);
      std::string pattern_name = optimized_exprs[i].substr(name_start, name_end - name_start);

      FusionGroup group;
      group.patternName = pattern_name;
      group.rootOp = neura_ops[i];
      group.rootIndex = i;
      group.frequency = fused_pattern_map.count(pattern_name) ? fused_pattern_map[pattern_name].frequency : 1;

      // Gets the allowed operation types from the pattern.
      std::set<std::string> allowed_ops;
      if (fused_pattern_map.count(pattern_name)) {
        for (const auto& op_name : fused_pattern_map[pattern_name].operators) {
          allowed_ops.insert(op_name);
        }
      }
      
      // Helper lambda to normalize operation names (same as NeuraToSExpr).
      auto normalizeOpName = [](llvm::StringRef op_name) -> std::string {
        if (op_name == "grant_predicate") return "grant_pred";
        return op_name.str();
      };

      // Collects operations in the fusion group via BFS.
      // BFS continues through non-matching ops to find all pattern-matching ops.
      std::set<Operation*> ops_in_fusion;
      std::set<Operation*> visited_in_bfs;
      std::queue<Operation*> worklist;
      for (Value operand : neura_ops[i]->getOperands()) {
        if (Operation* def_op = operand.getDefiningOp()) {
          worklist.push(def_op);
        }
      }
      
      while (!worklist.empty()) {
        Operation* op = worklist.front();
        worklist.pop();
        
        if (visited_in_bfs.count(op)) continue;
        visited_in_bfs.insert(op);
        
        if (!op->getDialect() || op->getDialect()->getNamespace() != "neura") continue;

        llvm::StringRef op_name = op->getName().stripDialect();
        
        if (op_name == "reserve") continue;
        
        std::string normalized_name = normalizeOpName(op_name);
        bool is_in_pattern = allowed_ops.empty() || allowed_ops.count(normalized_name) > 0;
        
        if (is_in_pattern) {
          ops_in_fusion.insert(op);
        }
        
        // Continue BFS through all operands regardless of whether this op is in the pattern.
        for (Value operand : op->getOperands()) {
          if (Operation* def_op = operand.getDefiningOp()) {
            if (!visited_in_bfs.count(def_op)) {
              worklist.push(def_op);
            }
          }
        }
      }

      // Sorts operations in topological order.
      std::vector<Operation*> sorted_ops;
      std::set<Operation*> visited;
      std::function<void(Operation*)> topo_sort = [&](Operation* op) {
        if (visited.count(op) || !ops_in_fusion.count(op)) return;
        visited.insert(op);
        for (Value operand : op->getOperands()) {
          if (Operation* def_op = operand.getDefiningOp()) {
            if (ops_in_fusion.count(def_op)) topo_sort(def_op);
          }
        }
        sorted_ops.push_back(op);
      };
      for (Operation* op : ops_in_fusion) topo_sort(op);

      group.opsInGroup = sorted_ops;

      // Computes external inputs.
      llvm::SetVector<Value> input_set;
      for (Operation* op : sorted_ops) {
        for (Value operand : op->getOperands()) {
          if (!operand.getDefiningOp() || !ops_in_fusion.count(operand.getDefiningOp())) {
            input_set.insert(operand);
          }
        }
      }
      group.externalInputs.assign(input_set.begin(), input_set.end());

      // Computes external outputs.
      llvm::SetVector<Value> output_set;
      for (Operation* op : sorted_ops) {
        for (Value result : op->getResults()) {
          for (Operation* user : result.getUsers()) {
            if (!ops_in_fusion.count(user)) {
              output_set.insert(result);
              break;
            }
          }
        }
      }
      group.externalOutputs.assign(output_set.begin(), output_set.end());

      fusion_groups.push_back(group);
    }
    
    // Filters out subset groups.
    std::vector<bool> keep_group(fusion_groups.size(), true);
    for (size_t i = 0; i < fusion_groups.size(); ++i) {
      if (!keep_group[i]) continue;
      std::set<Operation*> ops_set_i(fusion_groups[i].opsInGroup.begin(), fusion_groups[i].opsInGroup.end());
      for (size_t j = 0; j < fusion_groups.size(); ++j) {
        if (i == j || !keep_group[j]) continue;
        std::set<Operation*> ops_set_j(fusion_groups[j].opsInGroup.begin(), fusion_groups[j].opsInGroup.end());
        if (ops_set_j.size() < ops_set_i.size()) {
          bool is_subset = std::all_of(ops_set_j.begin(), ops_set_j.end(), 
                                       [&](Operation* op) { return ops_set_i.count(op); });
          if (is_subset) keep_group[j] = false;
        }
      }
    }

    std::vector<FusionGroup> filtered_groups;
    for (size_t i = 0; i < fusion_groups.size(); ++i) {
      if (keep_group[i]) {
        filtered_groups.push_back(fusion_groups[i]);
      }
    }
    fusion_groups = std::move(filtered_groups);

    if (neura_ops.empty()) return;
    Operation* parent_op = neura_ops[0]->getParentOp();
    if (!parent_op) return;
    Location loc = parent_op->getLoc();

    // Creates FusedOp for each fusion group.
    for (auto& group : fusion_groups) {
      if (group.opsInGroup.empty()) {
        continue;
      }
      if (group.externalOutputs.empty()) {
        continue;
      }

      Block* block = group.opsInGroup.front()->getBlock();
      std::set<Operation*> ops_in_group(group.opsInGroup.begin(), group.opsInGroup.end());
      
      // Find the last operation in the fusion group (in program order).
      Operation* last_in_group = nullptr;
      for (Operation& op : *block) {
        if (ops_in_group.count(&op)) {
          last_in_group = &op;
        }
      }
      
      if (!last_in_group) {
        continue;
      }
      
      // Step 2: Find the earliest external user (must come after the fusion).
      // Note: ctrl_mov operations are excluded because they represent loop feedback.
      Operation* earliest_user = nullptr;
      
      for (Value output : group.externalOutputs) {
        for (Operation* user : output.getUsers()) {
          if (ops_in_group.count(user)) continue;
          if (user->getBlock() != block) continue;
          
          // Skip ctrl_mov operations as they represent loop feedback.
          llvm::StringRef user_name = user->getName().stripDialect();
          if (user_name == "ctrl_mov") {
            continue;
          }
          
          if (!earliest_user || user->isBeforeInBlock(earliest_user)) {
            earliest_user = user;
          }
        }
      }
      
      // Step 3: Check if we can insert after last_in_group.
      // The FusedOp must be inserted before the earliest external user.
      Operation* insert_point = nullptr;
      
      if (earliest_user && earliest_user->isBeforeInBlock(last_in_group)) {
        // The earliest external user is before the last op in the group.
        // This can happen in循环 structures where outputs feed back.
        // Try to find a position after earliest_user but before all ops that use the outputs.
        
        // Find the last operation in the fusion group that comes before earliest_user.
        Operation* last_before_user = nullptr;
        for (Operation& op : *block) {
          if (!ops_in_group.count(&op)) continue;
          if (earliest_user->isBeforeInBlock(&op)) break;
          last_before_user = &op;
        }
        
        if (last_before_user) {
          // Check if this position is after all ops in the fusion group.
          bool all_before = true;
          for (Operation* fused_op : group.opsInGroup) {
            if (last_before_user->isBeforeInBlock(fused_op)) {
              all_before = false;
              break;
            }
          }
          
          if (all_before) {
            insert_point = last_before_user;
          }
        }
        
        if (!insert_point) {
          continue;
        }
      } else {
        insert_point = last_in_group;
      }

      OpBuilder builder(block, std::next(Block::iterator(insert_point)));
      SmallVector<Type> output_types;
      for (Value output : group.externalOutputs) {
        output_types.push_back(output.getType());
      }

      auto fused_op = builder.create<neura::FusedOp>(
          loc, TypeRange(output_types), group.externalInputs,
          builder.getI64IntegerAttr(group.rootIndex),
          builder.getStringAttr(group.patternName),
          builder.getI64IntegerAttr(group.frequency));

      // Creates the body block with arguments for external inputs.
      Block* body = builder.createBlock(&fused_op.getBody());
      for (Value input : group.externalInputs) {
        body->addArgument(input.getType(), loc);
      }
      
      // Clones operations into the fused body.
      IRMapping mapping;
      for (size_t i = 0; i < group.externalInputs.size(); ++i) {
        mapping.map(group.externalInputs[i], body->getArgument(i));
      }

      builder.setInsertionPointToEnd(body);
      for (Operation* op : group.opsInGroup) {
        Operation* cloned_op = builder.clone(*op, mapping);
        for (size_t i = 0; i < op->getNumResults(); ++i) {
          mapping.map(op->getResult(i), cloned_op->getResult(i));
        }
      }

      // Creates yield operation.
      SmallVector<Value> yield_values;
      for (Value output : group.externalOutputs) {
        yield_values.push_back(mapping.lookup(output));
      }
      builder.create<neura::YieldOp>(loc, yield_values);

      // Replaces uses of original outputs with fused results.
      std::set<Operation*> ops_in_this_group(group.opsInGroup.begin(), group.opsInGroup.end());
      for (size_t i = 0; i < group.externalOutputs.size(); ++i) {
        group.externalOutputs[i].replaceUsesWithIf(fused_op.getResult(i), [&](OpOperand& use) {
          Operation* user = use.getOwner();
          if (ops_in_this_group.count(user)) return false;
          if (llvm::isa<neura::YieldOp>(user) && user->getParentOp() == fused_op) return false;
          return true;
        });
      }
    }
    
    // Erases the original operations that have been fused.
    for (auto& group : fusion_groups) {
      for (auto it = group.opsInGroup.rbegin(); it != group.opsInGroup.rend(); ++it) {
        Operation* op = *it;
        bool can_erase = std::all_of(op->getResults().begin(), op->getResults().end(),
                                     [](Value result) { return result.use_empty(); });
        if (can_erase) op->erase();
      }
    }
  }
};

} // anonymous namespace

//===----------------------------------------------------------------------===//
// Pass Creation
//===----------------------------------------------------------------------===//

/// Creates a new ProcessNeura pass instance.
std::unique_ptr<Pass> createProcessNeuraPass() {
  return std::make_unique<ProcessNeuraPass>();
}

} // namespace egg
} // namespace mlir
