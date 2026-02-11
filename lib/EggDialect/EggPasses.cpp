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
  Operation* insertionPoint;  // Valid insertion point for the fused op.
};

struct ProcessNeuraPass : public impl::ProcessNeuraBase<ProcessNeuraPass> {
  using impl::ProcessNeuraBase<ProcessNeuraPass>::ProcessNeuraBase;

  /// Executes the egg-process-neura pass on the module.
  void runOnOperation() override {
    ModuleOp module = getOperation();

    std::string ppa_spec_file = getAreaSpecFile();
    if (ppa_spec_file.empty()) {
      ppa_spec_file = areaSpecFile;
    }

    if (ppa_spec_file.empty()) {
      llvm::errs() << "Error: --area-spec is required for egg-process-neura pass.\n";
      signalPassFailure();
      return;
    }

    PPASpec ppa_spec;
    if (!parsePPASpecFile(ppa_spec_file, ppa_spec)) {
      llvm::errs() << "Error: Failed to parse PPA spec file: " << ppa_spec_file << "\n";
      signalPassFailure();
      return;
    }
    
    // Collects Neura operations and converts them to S-expressions.
    NeuraToSExpr converter;
    std::vector<std::string> all_sexprs;
    std::vector<Operation*> neura_ops;

    module.walk([&](Operation *op) {
      if (op->getDialect() && op->getDialect()->getNamespace() == "neura") {
        if (!op->use_empty()) {
          return;
        }
        std::string sexpr = converter.convert(op);
        if (!sexpr.empty()) {
          all_sexprs.push_back(sexpr);
          neura_ops.push_back(op);
        }
      }
    });
    
    // Removes S-expressions that are completely contained in other expressions.
    // This avoids duplicate pattern counting when a smaller expression is part
    // of a larger one (e.g., "(phi_start ...)" inside "(load (phi_start ...))").
    std::vector<bool> is_subexpr(all_sexprs.size(), false);
    for (size_t i = 0; i < all_sexprs.size(); ++i) {
      if (is_subexpr[i]) continue;
      for (size_t j = 0; j < all_sexprs.size(); ++j) {
        if (i == j || is_subexpr[j]) continue;
        // Checks if expression j is a substring of expression i.
        if (all_sexprs[i].size() > all_sexprs[j].size() &&
            all_sexprs[i].find(all_sexprs[j]) != std::string::npos) {
          is_subexpr[j] = true;
        }
      }
    }
    
    // Filters out sub-expressions.
    std::vector<std::string> filtered_sexprs;
    std::vector<Operation*> filtered_ops;
    for (size_t i = 0; i < all_sexprs.size(); ++i) {
      if (!is_subexpr[i]) {
        filtered_sexprs.push_back(all_sexprs[i]);
        filtered_ops.push_back(neura_ops[i]);
      }
    }
    all_sexprs = std::move(filtered_sexprs);
    neura_ops = std::move(filtered_ops);

    // Extracts patterns directly from DFG to avoid duplicate counting.
    // When DAG is converted to expression tree, shared nodes appear multiple times,
    // which inflates the frequency count. By traversing the DFG directly, we count
    // each unique subgraph instance exactly once.
    // max_critical_path_latency is set to 1000ps by default.
    // Note: We pass all neura operations (not just roots) to allow extracting
    // patterns rooted at any operation, including intermediate ones like add, mul.
    std::vector<Operation*> all_ops_for_pattern;
    module.walk([&](Operation* op) {
      if (op->getDialect() && op->getDialect()->getNamespace() == "neura") {
        all_ops_for_pattern.push_back(op);
      }
    });
    auto patterns = RewriteRuleGenerator::extractPatternsFromDFG(
        all_ops_for_pattern, ppa_spec, minPatternFrequency, maxPatternArea, maxPatternOps, 1000);
    auto fusion_rules = RewriteRuleGenerator::generateFusionRulesFromPatterns(patterns);
    
    std::vector<RewriteRule> all_rules;
    all_rules.insert(all_rules.end(), fusion_rules.begin(), fusion_rules.end());
    
    // TODO: Enable these rules once the pattern format is compatible.
    // auto algebraic_rules = RewriteRuleGenerator::getAlgebraicIdentityRules();
    // auto commutativity_rules = RewriteRuleGenerator::getCommutativityRules();
    // auto associativity_rules = RewriteRuleGenerator::getAssociativityRules();

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
    
    llvm::errs() << "\n=== EGraph Saturation Results ===\n";
    std::vector<std::string> optimized_exprs;
    for (size_t i = 0; i < all_sexprs.size(); ++i) {
      CycleAwareSaturationResult result = runCycleAwareSaturation(all_sexprs[i], all_rules, ppa_spec.area_map, config);
      llvm::errs() << "Expression [" << i << "]:\n";
      llvm::errs() << "  Input:  " << all_sexprs[i] << "\n";
      if (result.isSuccess()) {
        llvm::errs() << "  Output: " << result.resultExpr << "\n";
        llvm::errs() << "  Status: SUCCESS (iterations=" << result.iterations 
                     << ", egraph_size=" << result.egraphSize << ")\n";
        optimized_exprs.push_back(result.resultExpr);
      } else {
        llvm::errs() << "  Output: (unchanged)\n";
        llvm::errs() << "  Status: FAILED (" << result.errorMsg << ")\n";
        optimized_exprs.push_back(all_sexprs[i]);
      }
    }
    llvm::errs() << "=================================\n\n";

    // Identifies fusion groups by pattern matching on IR.
    // Strategy: For each extracted pattern, find all matching instances in the IR.
    // Each instance becomes a separate FusedOp.
    
    // Helper lambda to normalize operation names (same as NeuraToSExpr).
    auto normalizeOpName = [](llvm::StringRef op_name) -> std::string {
      if (op_name == "grant_predicate") return "grant_pred";
      if (op_name == "constant") return "const";
      return op_name.str();
    };
    
    // Helper function to check if an operation matches a pattern and collect matching ops.
    // Returns true if the operation tree rooted at 'op' matches the pattern.
    std::function<bool(Operation*, const std::string&, std::vector<Operation*>&)> matchPattern;
    matchPattern = [&](Operation* op, const std::string& pattern, std::vector<Operation*>& matched_ops) -> bool {
      if (!op || pattern.empty()) return false;
      
      // Parses the pattern operator.
      if (pattern[0] != '(') {
        // Variable placeholder - matches anything.
        return pattern[0] == '?';
      }
      
      size_t space_pos = pattern.find(' ', 1);
      size_t close_paren = pattern.find(')', 1);
      if (space_pos == std::string::npos || close_paren < space_pos) {
        // No space before closing paren - leaf pattern like (const).
        space_pos = close_paren;
      }
      std::string pattern_op = pattern.substr(1, space_pos - 1);
      
      // Checks if the operation matches.
      if (!op->getDialect() || op->getDialect()->getNamespace() != "neura") return false;
      std::string op_name = normalizeOpName(op->getName().stripDialect());
      if (op_name != pattern_op) return false;
      
      // Adds this op to matched list.
      matched_ops.push_back(op);
      
      // For leaf patterns like (const), no need to match operands.
      if (space_pos == close_paren) {
        return true;
      }
      
      // Parses pattern arguments using a proper bracket-aware parser.
      std::vector<std::string> pattern_args;
      size_t pos = space_pos + 1;  // Skip the space after operator.
      while (pos < pattern.size() - 1) {  // -1 to skip final ')'.
        // Skips whitespace.
        while (pos < pattern.size() - 1 && std::isspace(pattern[pos])) pos++;
        if (pos >= pattern.size() - 1) break;
        
        size_t arg_start = pos;
        if (pattern[pos] == '(') {
          // Nested expression - finds matching closing bracket.
          int depth = 1;
          pos++;
          while (pos < pattern.size() && depth > 0) {
            if (pattern[pos] == '(') depth++;
            else if (pattern[pos] == ')') depth--;
            pos++;
          }
          pattern_args.push_back(pattern.substr(arg_start, pos - arg_start));
        } else {
          // Simple token - reads until space or closing bracket.
          while (pos < pattern.size() - 1 && !std::isspace(pattern[pos]) && pattern[pos] != ')') {
            pos++;
          }
          if (pos > arg_start) {
            pattern_args.push_back(pattern.substr(arg_start, pos - arg_start));
          }
        }
      }
      
      // Matches operands recursively.
      size_t num_operands = op->getNumOperands();
      for (size_t i = 0; i < pattern_args.size() && i < num_operands; ++i) {
        if (pattern_args[i][0] == '?') {
          // Variable placeholder - matches anything, do not recurse.
          continue;
        }
        Operation* operand_op = op->getOperand(i).getDefiningOp();
        if (!matchPattern(operand_op, pattern_args[i], matched_ops)) {
          return false;
        }
      }
      
      return true;
    };
    
    // Finds a valid insertion point for the fused operation.
    // Reference: IterMergePatternPass::findValidInsertionPoint
    auto findValidInsertionPoint = [](
        const std::vector<Operation*>& ops_in_group,
        const llvm::DenseSet<Operation*>& pattern_ops,
        const SmallVector<Value>& valid_inputs,
        const SmallVector<Value>& valid_outputs) -> Operation* {
      
      if (ops_in_group.empty()) return nullptr;
      
      Block* block = ops_in_group.front()->getBlock();
      if (!block) return nullptr;
      
      // All operations must be in the same block.
      for (Operation* op : ops_in_group) {
        if (op->getBlock() != block) {
          return nullptr;  
        }
      }
      
      // Finds the earliest position: after all input definitions.
      Operation* earliest_point = nullptr;
      
      for (Value input : valid_inputs) {
        Operation* def_op = input.getDefiningOp();
        if (!def_op) {
          continue;
        }
        
        if (def_op->getBlock() != block) {
          continue;
        }
        
        if (!earliest_point) {
          earliest_point = def_op;
        } else if (!def_op->isBeforeInBlock(earliest_point)) {
          earliest_point = def_op;
        }
      }
      
      // Finds the latest position: before all external uses of outputs.
      Operation* latest_point = nullptr;
      
      for (Value output : valid_outputs) {
        for (OpOperand& use : output.getUses()) {
          Operation* user = use.getOwner();
          
          if (pattern_ops.contains(user)) {
            continue;
          }
          
          if (user->getBlock() != block) {
            continue;
          }
          
          if (!latest_point) {
            latest_point = user;
          } else if (user->isBeforeInBlock(latest_point)) {
            latest_point = user;  
          }
        }
      }
      
      // If no earliest point found from inputs, uses the earliest op in group.
      if (!earliest_point) {
        earliest_point = ops_in_group.front();
        for (Operation* op : ops_in_group) {
          if (op->isBeforeInBlock(earliest_point)) {
            earliest_point = op;
          }
        }
      }
      
      // Checks valid range: [earliest_point, latest_point).
      if (latest_point) {
        if (!earliest_point->isBeforeInBlock(latest_point) || earliest_point == latest_point) {
          return nullptr;
        }
      }
      
      // Returns the valid insertion point (inserts after earliest_point).
      return earliest_point;
    };
    
    std::vector<FusionGroup> fusion_groups;
    std::set<Operation*> already_fused;  // Tracks operations already in a fusion group.
    
    // Groups patterns by their fused_name (e.g., "phi_start_grant_once").
    std::map<std::string, std::vector<const DFGPattern*>> pattern_groups;
    for (const auto& pattern : patterns) {
      std::string fused_name;
      for (size_t idx = 0; idx < pattern.operators.size(); ++idx) {
        if (idx > 0) fused_name += "_";
        fused_name += pattern.operators[idx];
      }
      pattern_groups[fused_name].push_back(&pattern);
    }
    
    // Collects all neura operations in the module (not just roots).
    std::vector<Operation*> all_neura_ops;
    module.walk([&](Operation* op) {
      if (op->getDialect() && op->getDialect()->getNamespace() == "neura") {
        all_neura_ops.push_back(op);
      }
    });
    
    // Counts instances per pattern type.
    std::map<std::string, int> pattern_instance_count;
    
    // Processes pattern groups in order (larger patterns first for better fusion).
    for (const auto& [fused_name, pattern_variants] : pattern_groups) {
      // Tries to match starting from each operation in the IR.
      for (Operation* op : all_neura_ops) {
        if (!op || already_fused.count(op)) continue;
        
        // Tries to match any variant of this pattern.
        for (const DFGPattern* pattern : pattern_variants) {
          std::vector<Operation*> matched_ops;
          if (matchPattern(op, pattern->pattern, matched_ops)) {
            // Checks if any matched op is already fused.
            bool has_conflict = false;
            for (Operation* matched_op : matched_ops) {
              if (already_fused.count(matched_op)) {
                has_conflict = true;
                break;
              }
            }
            
            if (has_conflict || matched_ops.empty()) {
              continue;
            }
            
            // Sorts in topological order.
            std::set<Operation*> matched_set(matched_ops.begin(), matched_ops.end());
            std::vector<Operation*> sorted_ops;
            std::set<Operation*> visited;
            std::function<void(Operation*)> topo_sort = [&](Operation* op) {
              if (visited.count(op) || !matched_set.count(op)) return;
              visited.insert(op);
              for (Value operand : op->getOperands()) {
                if (Operation* def_op = operand.getDefiningOp()) {
                  if (matched_set.count(def_op)) topo_sort(def_op);
                }
              }
              sorted_ops.push_back(op);
            };
            for (Operation* matched_op : matched_ops) topo_sort(matched_op);
            
            // Computes external inputs (reference: rewritePatternInstance).
            llvm::SetVector<Value> input_set;
            for (Operation* group_op : sorted_ops) {
              for (Value operand : group_op->getOperands()) {
                Operation* def_op = operand.getDefiningOp();
                if (!def_op || !matched_set.count(def_op)) {
                  input_set.insert(operand);
                }
              }
            }
            SmallVector<Value> valid_inputs = input_set.takeVector();
            
            // Computes external outputs.
            llvm::SetVector<Value> output_set;
            for (Operation* group_op : sorted_ops) {
              for (Value result : group_op->getResults()) {
                bool has_external_use = false;
                for (OpOperand& use : result.getUses()) {
                  Operation* user = use.getOwner();
                  if (!matched_set.count(user)) {
                    has_external_use = true;
                    break;
                  }
                }
                
                if (has_external_use) {
                  output_set.insert(result);
                }
              }
            }
            SmallVector<Value> valid_outputs = output_set.takeVector();
            
            // Skips if no external outputs and the root operation has results.
            // For side-effect operations (like store), no outputs is acceptable.
            Operation* root_op = sorted_ops.back();  // Root is the last in topo order.
            bool has_side_effect = root_op->getNumResults() == 0;
            
            // For side-effect patterns, if there are external outputs, it means
            // intermediate operations are used outside the pattern - skip for now.
            if (has_side_effect && !valid_outputs.empty()) {
              continue;
            }
            
            if (valid_outputs.empty() && !has_side_effect) {
              continue;
            }
            
            // For side-effect operations without outputs, use an empty output list.
            // The fusion will still be valid as it represents a side-effect pattern.
            
            // Finds valid insertion point.
            llvm::DenseSet<Operation*> pattern_ops_set(matched_ops.begin(), matched_ops.end());
            Operation* insertion_point = findValidInsertionPoint(
                sorted_ops, pattern_ops_set, valid_inputs, valid_outputs);
            
            if (!insertion_point) {
              continue;
            }
            
            // Creates a fusion group for this instance.
            FusionGroup group;
            group.patternName = fused_name;
            group.rootOp = matched_ops.back();  // Root of the pattern tree.
            group.rootIndex = std::find(neura_ops.begin(), neura_ops.end(), op) - neura_ops.begin();
            group.frequency = 1;  // Placeholder, will be updated later.
            group.opsInGroup = sorted_ops;
            group.externalInputs.assign(valid_inputs.begin(), valid_inputs.end());
            group.externalOutputs.assign(valid_outputs.begin(), valid_outputs.end());
            group.insertionPoint = insertion_point;  // Saves valid insertion point.
            
            fusion_groups.push_back(group);
            pattern_instance_count[fused_name]++;
            for (Operation* matched_op : matched_ops) {
              already_fused.insert(matched_op);
            }
            
            // Break after first successful match to avoid duplicate counting.
            break;
          }
        }
      }
    }
  
    // Updates frequency for all fusion groups of the same pattern type.
    for (auto& group : fusion_groups) {
      group.frequency = pattern_instance_count[group.patternName];
    }
    
    llvm::errs() << "\n=== Creating FusedOp ===\n";
    llvm::errs() << "Total fusion groups found: " << fusion_groups.size() << "\n";

    if (neura_ops.empty()) return;
    Operation* parent_op = neura_ops[0]->getParentOp();
    if (!parent_op) return;
    Location loc = parent_op->getLoc();

    // Creates FusedOp for each fusion group.
    for (auto& group : fusion_groups) {
      if (group.opsInGroup.empty()) {
        continue;
      }
      // Note: externalOutputs can be empty for side-effect patterns like store.

      Block* block = group.opsInGroup.front()->getBlock();
      
      // Uses the pre-computed valid insertion point.
      if (!group.insertionPoint) {
        llvm::errs() << "Warning: No valid insertion point for pattern " 
                     << group.patternName << "\n";
        continue;
      }
      
      Operation* insert_point = group.insertionPoint;

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
      builder.create<neura::YieldOp>(loc, ValueRange{}, yield_values);

      // Replaces uses of original outputs with fused results.
      // Only replaces uses that are NOT before the fused_op in the block.
      std::set<Operation*> ops_in_this_group(group.opsInGroup.begin(), group.opsInGroup.end());
      for (size_t i = 0; i < group.externalOutputs.size(); ++i) {
        group.externalOutputs[i].replaceUsesWithIf(fused_op.getResult(i), [&](OpOperand& use) {
          Operation* user = use.getOwner();
          // Do not replace uses within the fusion group itself.
          if (ops_in_this_group.count(user)) return false;
          // Do not replace uses in the yield operation of this fused_op.
          if (llvm::isa<neura::YieldOp>(user) && user->getParentOp() == fused_op) return false;
          // Do not replace uses that are in a different block.
          if (user->getBlock() != fused_op->getBlock()) return false;
          // Do not replace uses that come before the fused_op in program order.
          if (user->isBeforeInBlock(fused_op)) return false;
          return true;
        });
      }
      
      llvm::errs() << "  Created fused_op '" << group.patternName << "' with " 
                   << group.opsInGroup.size() << " ops, " 
                   << group.externalOutputs.size() << " outputs\n";
    }
    llvm::errs() << "=================================\n";
    
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
