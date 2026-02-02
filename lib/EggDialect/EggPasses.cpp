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
#include <regex>
#include <set>
#include <map>

namespace mlir {
namespace egg {

#define GEN_PASS_DECL_PROCESSNEURA
#define GEN_PASS_DEF_PROCESSNEURA
#include "EggDialect/EggPasses.h.inc"

namespace {

struct ProcessNeuraPass : public impl::ProcessNeuraBase<ProcessNeuraPass> {
  using impl::ProcessNeuraBase<ProcessNeuraPass>::ProcessNeuraBase;

  // Extracts arguments from a fused S-expression, e.g. (fused name arg1 arg2 ...) -> [arg1, arg2, ...].
  std::vector<std::string> parseFusedArgs(const std::string& expr) {
    std::vector<std::string> args;
    size_t pos = expr.find("(fused ");
    if (pos == std::string::npos) {
      return args;
    }
    pos += 7;

    while (pos < expr.size() && expr[pos] != ' ' && expr[pos] != ')') {
      pos++;
    }

    while (pos < expr.size()) {
      while (pos < expr.size() && expr[pos] == ' ') {
        pos++;
      }
      if (pos >= expr.size() || expr[pos] == ')') {
        break;
      }

      std::string arg;
      if (expr[pos] == '(') {
        int depth = 1;
        arg += expr[pos++];
        while (pos < expr.size() && depth > 0) {
          if (expr[pos] == '(') {
            depth++;
          } else if (expr[pos] == ')') {
            depth--;
          }
          arg += expr[pos++];
        }
      } else if (expr[pos] == '"') {
        arg += expr[pos++];
        while (pos < expr.size() && expr[pos] != '"') {
          arg += expr[pos++];
        }
        if (pos < expr.size()) {
          arg += expr[pos++];
        }
      } else {
        while (pos < expr.size() && expr[pos] != ' ' && expr[pos] != ')') {
          arg += expr[pos++];
        }
      }

      if (!arg.empty()) {
        args.push_back(arg);
      }
    }

    return args;
  }
  
  // Finds the MLIR Value that corresponds to the given S-expression argument.
  Value findValueForArg(const std::string& arg,
                        const std::vector<Operation*>& neura_ops,
                        const std::vector<std::string>& all_sexprs,
                        OpBuilder& builder, Location loc) {
    if (arg.find("(reserve ") == 0) {
      for (size_t i = 0; i < all_sexprs.size() && i < neura_ops.size(); ++i) {
        if (all_sexprs[i] == arg && neura_ops[i]) {
          if (neura_ops[i]->getNumResults() > 0) {
            return neura_ops[i]->getResult(0);
          }
        }
      }
    }

    if (arg == "eq" || arg == "ne" || arg == "slt" || arg == "sgt" ||
        arg == "sle" || arg == "sge" || arg == "ult" || arg == "ugt" ||
        arg == "ule" || arg == "uge") {
      return Value();
    }

    bool is_integer = !arg.empty() &&
        std::all_of(arg.begin(), arg.end(), [](char c) {
          return std::isdigit(c) || c == '-';
        });
    if (is_integer) {
      int64_t val = std::stoll(arg);
      for (size_t i = 0; i < neura_ops.size(); ++i) {
        if (!neura_ops[i]) {
          continue;
        }
        if (auto grant_once = dyn_cast<neura::GrantOnceOp>(neura_ops[i])) {
          if (auto const_attr = grant_once->getAttrOfType<IntegerAttr>("constant_value")) {
            if (const_attr.getInt() == val) {
              return grant_once.getResult();
            }
          }
        }
      }
    }

    if (arg.size() > 2 && arg[0] == '"' && arg.back() == '"') {
      std::string unquoted = arg.substr(1, arg.size() - 2);
      for (size_t i = 0; i < neura_ops.size(); ++i) {
        if (!neura_ops[i]) {
          continue;
        }
        if (auto grant_once = dyn_cast<neura::GrantOnceOp>(neura_ops[i])) {
          if (auto const_attr = grant_once->getAttrOfType<StringAttr>("constant_value")) {
            if (const_attr.getValue() == unquoted) {
              return grant_once.getResult();
            }
          }
        }
      }
    }

    return Value();
  }

  // Runs the egg-process-neura pass on the module.
  void runOnOperation() override {
    ModuleOp module = getOperation();

    std::string effective_area_spec_file = getAreaSpecFile();
    if (effective_area_spec_file.empty()) {
      effective_area_spec_file = areaSpecFile;
    }

    if (effective_area_spec_file.empty()) {
      llvm::errs() << "Error: --area-spec is required for egg-process-neura pass.\n";
      llvm::errs() << "Please provide an area specification YAML file using --area-spec=<path>\n";
      signalPassFailure();
      return;
    }

    llvm::errs() << "areaSpecFile: " << effective_area_spec_file << "\n";
    AreaMap area_map;
    llvm::errs() << "=== Loading Area Specification ===\n";
    llvm::errs() << "Area spec file: " << effective_area_spec_file << "\n";

    if (!parseAreaSpecFile(effective_area_spec_file, area_map)) {
      llvm::errs() << "Error: Failed to parse area spec file: " << effective_area_spec_file << "\n";
      signalPassFailure();
      return;
    }
    
    llvm::errs() << "Loaded " << area_map.size() << " area specifications:\n";
    for (const auto& entry : area_map) {
      llvm::errs() << "  " << entry.first << ": " << entry.second << "\n";
    }
    llvm::errs() << "\n";

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

    llvm::errs() << "=== Egg Equality Saturation Pass ===\n";
    llvm::errs() << "Collected " << all_sexprs.size() << " S-expressions from DFG:\n";
    for (size_t i = 0; i < all_sexprs.size(); ++i) {
      llvm::errs() << "  [" << i << "] " << all_sexprs[i] << "\n";
    }
    llvm::errs() << "\n";

    auto patterns = RewriteRuleGenerator::extractPatterns(all_sexprs, 2);
    
    llvm::errs() << "Extracted " << patterns.size() << " patterns with frequency >= 2:\n";
    for (size_t i = 0; i < patterns.size(); ++i) {
      llvm::errs() << "  [" << i << "] Pattern: " << patterns[i].pattern << "\n";
      llvm::errs() << "       Frequency: " << patterns[i].frequency 
                   << ", Op count: " << patterns[i].opCount << "\n";
    }
    llvm::errs() << "\n";

    auto fusion_rules = RewriteRuleGenerator::generateFusionRulesFromPatterns(patterns);
    auto algebraic_rules = RewriteRuleGenerator::getAlgebraicIdentityRules();
    auto commutativity_rules = RewriteRuleGenerator::getCommutativityRules();
    auto associativity_rules = RewriteRuleGenerator::getAssociativityRules();

    std::vector<RewriteRule> all_rules;
    all_rules.insert(all_rules.end(), fusion_rules.begin(), fusion_rules.end());
    all_rules.insert(all_rules.end(), algebraic_rules.begin(), algebraic_rules.end());
    all_rules.insert(all_rules.end(), commutativity_rules.begin(), commutativity_rules.end());
    all_rules.insert(all_rules.end(), associativity_rules.begin(), associativity_rules.end());

    llvm::errs() << "Generated " << fusion_rules.size() << " fusion rules\n";
    llvm::errs() << "Total rules (including algebraic): " << all_rules.size() << "\n\n";

    llvm::errs() << "Fusion rules:\n";
    for (size_t i = 0; i < fusion_rules.size(); ++i) {
      llvm::errs() << "  " << fusion_rules[i].name << ":\n";
      llvm::errs() << "    " << fusion_rules[i].lhs << "\n";
      llvm::errs() << "    -> " << fusion_rules[i].rhs << "\n";
    }
    llvm::errs() << "\n";

    EggConfig config;
    config.iterLimit = 30;
    config.nodeLimit = 10000;
    config.timeLimitSecs = 60;

    llvm::StringMap<FusedPatternInfo> fused_pattern_map;
    for (const auto& pattern : patterns) {
      std::string fused_name = "fused";
      for (const auto& op : pattern.operators) {
        std::string sanitized = op;
        if (sanitized == "+") {
          sanitized = "add";
        } else if (sanitized == "-") {
          sanitized = "sub";
        } else if (sanitized == "*") {
          sanitized = "mul";
        } else if (sanitized == "/") {
          sanitized = "div";
        }
        fused_name += "_" + sanitized;
      }

      FusedPatternInfo info;
      info.patternName = fused_name;
      info.originalPattern = pattern.pattern;
      info.frequency = pattern.frequency;
      info.operators = pattern.operators;
      fused_pattern_map[fused_name] = info;
    }
    
    llvm::errs() << "=== Running Equality Saturation ===\n";
    llvm::errs() << "(Using cycle-aware extraction with area optimization)\n\n";
    
    std::vector<std::string> optimized_exprs;
    for (size_t i = 0; i < all_sexprs.size(); ++i) {
      const std::string& expr = all_sexprs[i];

      llvm::errs() << "[" << i << "] Input:  " << expr << "\n";

      CycleAwareSaturationResult result = runCycleAwareSaturation(expr, all_rules, area_map, config);
      
      if (result.isSuccess()) {
        llvm::errs() << "    Output: " << result.resultExpr << "\n";
        llvm::errs() << "    (iterations=" << result.iterations 
                     << ", egraph_size=" << result.egraphSize 
                     << ", saturated=" << (result.saturated ? "yes" : "no") << ")\n";
        llvm::errs() << "    (cycle_nodes=" << result.cycleNodeCount
                     << ", off_cycle_area=" << result.offCycleArea
                     << ", ast_size=" << result.astSize << ")\n";
        optimized_exprs.push_back(result.resultExpr);
      } else {
        llvm::errs() << "    Error: " << result.errorMsg << "\n";
        optimized_exprs.push_back(expr);
      }
    }

    llvm::errs() << "\n=== Optimization Summary ===\n";

    size_t changed_count = 0;
    for (size_t i = 0; i < all_sexprs.size(); ++i) {
      if (all_sexprs[i] != optimized_exprs[i]) {
        changed_count++;
        llvm::errs() << "Changed [" << i << "]:\n";
        llvm::errs() << "  Before: " << all_sexprs[i] << "\n";
        llvm::errs() << "  After:  " << optimized_exprs[i] << "\n";
      }
    }
    llvm::errs() << "\nTotal: " << changed_count << "/" << all_sexprs.size() 
                 << " expressions optimized\n\n";
    
    llvm::errs() << "=== IR Reconstruction ===\n";

    Operation* parent_op = nullptr;
    if (!neura_ops.empty() && neura_ops[0]) {
      parent_op = neura_ops[0]->getParentOp();
    }

    if (!parent_op) {
      llvm::errs() << "Error: Could not find parent operation for reconstruction\n";
      return;
    }
    
    Region* parent_region = nullptr;
    if (auto kernel_op = dyn_cast<neura::KernelOp>(parent_op)) {
      parent_region = &kernel_op.getBody();
    } else if (auto func_op = dyn_cast<func::FuncOp>(parent_op)) {
      parent_region = &func_op.getBody();
    }

    if (!parent_region || parent_region->empty()) {
      llvm::errs() << "Error: Could not find parent region for reconstruction\n";
      return;
    }
    
    Location loc = parent_op->getLoc();

    std::map<Operation*, size_t> op_to_index;
    for (size_t i = 0; i < neura_ops.size(); ++i) {
      if (neura_ops[i]) {
        op_to_index[neura_ops[i]] = i;
      }
    }
    
    struct FusionGroup {
      std::string pattern_name;
      Operation* root_op;
      std::vector<Operation*> ops_in_group;
      SmallVector<Value> external_inputs;
      SmallVector<Value> external_outputs;
      int64_t frequency;
      size_t root_index;
    };

    std::vector<FusionGroup> fusion_groups;

    for (size_t i = 0; i < neura_ops.size() && i < optimized_exprs.size(); ++i) {
      if (!neura_ops[i]) {
        continue;
      }

      const std::string& optimized_expr = optimized_exprs[i];
      size_t fused_pos = optimized_expr.find("(fused ");
      if (fused_pos != std::string::npos) {
        size_t name_start = fused_pos + 7;
        size_t name_end = optimized_expr.find_first_of(" )", name_start);
        std::string pattern_name = optimized_expr.substr(name_start, name_end - name_start);

        llvm::errs() << "  [" << i << "] Found fused pattern: " << pattern_name << "\n";

        FusionGroup group;
        group.pattern_name = pattern_name;
        group.root_op = neura_ops[i];
        group.root_index = i;
        group.frequency = 1;

        if (fused_pattern_map.count(pattern_name)) {
          group.frequency = fused_pattern_map[pattern_name].frequency;
        }

        std::set<Operation*> ops_in_fusion;
        std::queue<Operation*> worklist;
        
        for (Value operand : neura_ops[i]->getOperands()) {
          if (Operation* defOp = operand.getDefiningOp()) {
            worklist.push(defOp);
          }
        }
        
        while (!worklist.empty()) {
          Operation* op = worklist.front();
          worklist.pop();
          
          if (ops_in_fusion.count(op)) {
            continue;
          }

          if (!op->getDialect() || op->getDialect()->getNamespace() != "neura") {
            continue;
          }

          llvm::StringRef op_name = op->getName().stripDialect();
          if (op_name == "grant_once" || op_name == "reserve") {
            continue;
          }

          ops_in_fusion.insert(op);
          for (Value operand : op->getOperands()) {
            if (Operation* def_op = operand.getDefiningOp()) {
              if (!ops_in_fusion.count(def_op)) {
                worklist.push(def_op);
              }
            }
          }
        }

        std::vector<Operation*> sorted_ops;
        std::set<Operation*> visited;

        std::function<void(Operation*)> topo_sort = [&](Operation* op) {
          if (visited.count(op) || !ops_in_fusion.count(op)) {
            return;
          }
          visited.insert(op);
          
          for (Value operand : op->getOperands()) {
            if (Operation* def_op = operand.getDefiningOp()) {
              if (ops_in_fusion.count(def_op)) {
                topo_sort(def_op);
              }
            }
          }
          sorted_ops.push_back(op);
        };

        for (Operation* op : ops_in_fusion) {
          topo_sort(op);
        }

        group.ops_in_group = sorted_ops;

        llvm::errs() << "    -> opsInGroup size: " << sorted_ops.size() << "\n";

        llvm::SetVector<Value> input_set;
        for (Operation* op : sorted_ops) {
          for (Value operand : op->getOperands()) {
            Operation* def_op = operand.getDefiningOp();
            if (!def_op || !ops_in_fusion.count(def_op)) {
              input_set.insert(operand);
            }
          }
        }
        group.external_inputs.assign(input_set.begin(), input_set.end());

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
        group.external_outputs.assign(output_set.begin(), output_set.end());

        fusion_groups.push_back(group);
      }
    }
    
    std::vector<bool> keep_group(fusion_groups.size(), true);
    for (size_t i = 0; i < fusion_groups.size(); ++i) {
      if (!keep_group[i]) {
        continue;
      }

      std::set<Operation*> ops_set_i(fusion_groups[i].ops_in_group.begin(),
                                     fusion_groups[i].ops_in_group.end());

      for (size_t j = 0; j < fusion_groups.size(); ++j) {
        if (i == j || !keep_group[j]) {
          continue;
        }

        std::set<Operation*> ops_set_j(fusion_groups[j].ops_in_group.begin(),
                                      fusion_groups[j].ops_in_group.end());

        if (ops_set_j.size() < ops_set_i.size()) {
          bool is_subset = true;
          for (Operation* op : ops_set_j) {
            if (!ops_set_i.count(op)) {
              is_subset = false;
              break;
            }
          }
          if (is_subset) {
            keep_group[j] = false;
          }
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

    llvm::errs() << "Found " << fusion_groups.size() << " fusion groups (after filtering)\n";
    
    std::sort(fusion_groups.begin(), fusion_groups.end(),
      [](const FusionGroup& a, const FusionGroup& b) {
        if (a.ops_in_group.empty() || b.ops_in_group.empty()) {
          return false;
        }
        Block* block_a = a.ops_in_group.front()->getBlock();
        Block* block_b = b.ops_in_group.front()->getBlock();
        if (block_a != block_b) {
          return block_a < block_b;
        }

        Operation* earliest_a = a.ops_in_group.front();
        Operation* earliest_b = b.ops_in_group.front();
        for (Operation* op : a.ops_in_group) {
          if (op->isBeforeInBlock(earliest_a)) {
            earliest_a = op;
          }
        }
        for (Operation* op : b.ops_in_group) {
          if (op->isBeforeInBlock(earliest_b)) {
            earliest_b = op;
          }
        }
        return earliest_a->isBeforeInBlock(earliest_b);
      });

    std::set<Operation*> all_fused_ops;
    for (const auto& group : fusion_groups) {
      for (Operation* op : group.ops_in_group) {
        all_fused_ops.insert(op);
      }
    }
    
    for (auto& group : fusion_groups) {
      if (group.ops_in_group.empty()) {
        continue;
      }

      std::set<Operation*> ops_in_fusion(group.ops_in_group.begin(), group.ops_in_group.end());
      llvm::SetVector<Value> input_set;
      for (Operation* op : group.ops_in_group) {
        for (Value operand : op->getOperands()) {
          Operation* def_op = operand.getDefiningOp();
          if (!def_op || !ops_in_fusion.count(def_op)) {
            input_set.insert(operand);
          }
        }
      }
      group.external_inputs.assign(input_set.begin(), input_set.end());

      llvm::SetVector<Value> output_set;
      for (Operation* op : group.ops_in_group) {
        for (Value result : op->getResults()) {
          for (Operation* user : result.getUsers()) {
            if (!ops_in_fusion.count(user)) {
              output_set.insert(result);
              break;
            }
          }
        }
      }
      group.external_outputs.assign(output_set.begin(), output_set.end());

      if (group.ops_in_group.empty() || group.external_outputs.empty()) {
        continue;
      }

      llvm::errs() << "Creating fused_op for pattern: " << group.pattern_name << "\n";
      llvm::errs() << "  Ops in group: " << group.ops_in_group.size() << "\n";
      llvm::errs() << "  External inputs: " << group.external_inputs.size() << "\n";
      llvm::errs() << "  External outputs: " << group.external_outputs.size() << "\n";

      Block* block = group.ops_in_group.front()->getBlock();

      std::set<Operation*> ops_in_this_group(group.ops_in_group.begin(), group.ops_in_group.end());
      Operation* earliest_user = nullptr;
      for (Value output : group.external_outputs) {
        for (Operation* user : output.getUsers()) {
          if (ops_in_this_group.count(user)) {
            continue;
          }
          if (user->getBlock() != block) {
            continue;
          }
          if (!earliest_user || user->isBeforeInBlock(earliest_user)) {
            earliest_user = user;
          }
        }
      }

      Operation* insert_point = nullptr;
      for (Value input : group.external_inputs) {
        if (Operation* def_op = input.getDefiningOp()) {
          if (def_op->getBlock() == block) {
            if (!insert_point || insert_point->isBeforeInBlock(def_op)) {
              insert_point = def_op;
            }
          }
        }
      }

      if (earliest_user && insert_point) {
        if (!insert_point->isBeforeInBlock(earliest_user)) {
          llvm::errs() << "  Warning: Input definition after external user\n";
        }
      }

      if (!insert_point) {
        insert_point = group.ops_in_group.front();
        for (Operation* op : group.ops_in_group) {
          if (op->isBeforeInBlock(insert_point)) {
            insert_point = op;
          }
        }
      }

      OpBuilder builder(insert_point->getBlock(), std::next(Block::iterator(insert_point)));
      SmallVector<Type> output_types;
      for (Value output : group.external_outputs) {
        output_types.push_back(output.getType());
      }

      auto fused_op = builder.create<neura::FusedOp>(
          loc,
          TypeRange(output_types),
          group.external_inputs,
          builder.getI64IntegerAttr(group.root_index),
          builder.getStringAttr(group.pattern_name),
          builder.getI64IntegerAttr(group.frequency));

      Block* body = builder.createBlock(&fused_op.getBody());
      for (Value input : group.external_inputs) {
        body->addArgument(input.getType(), loc);
      }
      
      IRMapping mapping;
      for (size_t j = 0; j < group.external_inputs.size(); ++j) {
        mapping.map(group.external_inputs[j], body->getArgument(j));
      }

      builder.setInsertionPointToEnd(body);
      for (Operation* op : group.ops_in_group) {
        Operation* cloned_op = builder.clone(*op, mapping);
        for (size_t j = 0; j < op->getNumResults(); ++j) {
          mapping.map(op->getResult(j), cloned_op->getResult(j));
        }
      }

      SmallVector<Value> yield_values;
      for (Value output : group.external_outputs) {
        yield_values.push_back(mapping.lookup(output));
      }
      builder.create<neura::YieldOp>(loc, yield_values);

      for (size_t j = 0; j < group.external_outputs.size(); ++j) {
        Value original_output = group.external_outputs[j];
        Value fused_result = fused_op.getResult(j);

        original_output.replaceUsesWithIf(fused_result, [&](OpOperand& use) {
          Operation* user = use.getOwner();
          if (ops_in_this_group.count(user)) {
            return false;
          }
          if (llvm::isa<neura::YieldOp>(user) && user->getParentOp() == fused_op) {
            return false;
          }
          return true;
        });
      }
    }
    
    for (auto& group : fusion_groups) {
      for (auto it = group.ops_in_group.rbegin(); it != group.ops_in_group.rend(); ++it) {
        Operation* op = *it;

        bool can_erase = true;
        for (Value result : op->getResults()) {
          if (!result.use_empty()) {
            can_erase = false;
            break;
          }
        }

        if (can_erase) {
          op->erase();
        }
      }
    }
    
    llvm::errs() << "IR reconstruction complete.\n\n";
  }
};

} // anonymous namespace

//===----------------------------------------------------------------------===//
// Pass Creation
//===----------------------------------------------------------------------===//

std::unique_ptr<Pass> createProcessNeuraPass() {
  return std::make_unique<ProcessNeuraPass>();
}

} // namespace egg
} // namespace mlir
