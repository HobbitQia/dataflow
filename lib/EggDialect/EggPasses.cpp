// EggPasses.cpp - Egg dialect passes implementation
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

//===----------------------------------------------------------------------===//
// Area Map for cycle-aware extraction
//===----------------------------------------------------------------------===//

// Global area map loaded from YAML file
static AreaMap g_opAreaMap;

//===----------------------------------------------------------------------===//
// ProcessNeura Pass
//===----------------------------------------------------------------------===//

namespace {

struct ProcessNeuraPass : public impl::ProcessNeuraBase<ProcessNeuraPass> {
  using impl::ProcessNeuraBase<ProcessNeuraPass>::ProcessNeuraBase;
  
  // Helper function to parse arguments from a fused S-expression
  // E.g., from "(fused name arg1 arg2 ...)" extract [arg1, arg2, ...]
  std::vector<std::string> parseFusedArgs(const std::string& expr) {
    std::vector<std::string> args;
    
    // Skip "(fused name " to get to arguments
    size_t pos = expr.find("(fused ");
    if (pos == std::string::npos) return args;
    
    pos += 7;  // Skip "(fused "
    
    // Skip the pattern name
    while (pos < expr.size() && expr[pos] != ' ' && expr[pos] != ')') {
      pos++;
    }
    
    // Now parse the arguments
    while (pos < expr.size()) {
      // Skip whitespace
      while (pos < expr.size() && expr[pos] == ' ') pos++;
      if (pos >= expr.size() || expr[pos] == ')') break;
      
      std::string arg;
      if (expr[pos] == '(') {
        // Nested expression - find matching close paren
        int depth = 1;
        arg += expr[pos++];
        while (pos < expr.size() && depth > 0) {
          if (expr[pos] == '(') depth++;
          else if (expr[pos] == ')') depth--;
          arg += expr[pos++];
        }
      } else if (expr[pos] == '"') {
        // Quoted string
        arg += expr[pos++];
        while (pos < expr.size() && expr[pos] != '"') {
          arg += expr[pos++];
        }
        if (pos < expr.size()) arg += expr[pos++];
      } else {
        // Simple token
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
  
  // Find the Value corresponding to an S-expression argument
  Value findValueForArg(const std::string& arg, 
                        const std::vector<Operation*>& neuraOps,
                        const std::vector<std::string>& allSexprs,
                        OpBuilder& builder, Location loc) {
    // Check if it's a reserve reference like "(reserve r0)"
    if (arg.find("(reserve ") == 0) {
      // Find the matching reserve operation
      for (size_t i = 0; i < allSexprs.size() && i < neuraOps.size(); ++i) {
        if (allSexprs[i] == arg && neuraOps[i]) {
          if (neuraOps[i]->getNumResults() > 0) {
            return neuraOps[i]->getResult(0);
          }
        }
      }
    }
    
    // Check if it's a comparison type (eq, ne, slt, etc.) - skip these
    if (arg == "eq" || arg == "ne" || arg == "slt" || arg == "sgt" ||
        arg == "sle" || arg == "sge" || arg == "ult" || arg == "ugt" ||
        arg == "ule" || arg == "uge") {
      // This is a comparison predicate, not a Value - skip it
      return Value();
    }
    
    // Check if it's a constant integer
    bool isInteger = !arg.empty() && 
        std::all_of(arg.begin(), arg.end(), [](char c) { 
          return std::isdigit(c) || c == '-'; 
        });
    if (isInteger) {
      // It's an integer constant - we need to find or create a grant_once
      int64_t val = std::stoll(arg);
      for (size_t i = 0; i < neuraOps.size(); ++i) {
        if (!neuraOps[i]) continue;
        if (auto grantOnce = dyn_cast<neura::GrantOnceOp>(neuraOps[i])) {
          if (auto constAttr = grantOnce->getAttrOfType<IntegerAttr>("constant_value")) {
            if (constAttr.getInt() == val) {
              return grantOnce.getResult();
            }
          }
        }
      }
    }
    
    // Check if it's a quoted string like "%arg1" 
    if (arg.size() > 2 && arg[0] == '"' && arg.back() == '"') {
      std::string unquoted = arg.substr(1, arg.size() - 2);
      // Find matching grant_once with this string value
      for (size_t i = 0; i < neuraOps.size(); ++i) {
        if (!neuraOps[i]) continue;
        if (auto grantOnce = dyn_cast<neura::GrantOnceOp>(neuraOps[i])) {
          if (auto constAttr = grantOnce->getAttrOfType<StringAttr>("constant_value")) {
            if (constAttr.getValue() == unquoted) {
              return grantOnce.getResult();
            }
          }
        }
      }
    }
    
    return Value();  // Not found
  }

  void runOnOperation() override {
    ModuleOp module = getOperation();
    
    // Load area specification from YAML file if provided
    AreaMap areaMap;
    bool useCycleAwareExtraction = false;
    if (!areaSpecFile.empty()) {
      llvm::errs() << "=== Loading Area Specification ===\n";
      llvm::errs() << "Area spec file: " << areaSpecFile << "\n";
      
      if (parseAreaSpecFile(areaSpecFile, areaMap)) {
        useCycleAwareExtraction = true;
        llvm::errs() << "Loaded " << areaMap.size() << " area specifications:\n";
        for (const auto& entry : areaMap) {
          llvm::errs() << "  " << entry.first << ": " << entry.second << "\n";
        }
        llvm::errs() << "\n";
      } else {
        llvm::errs() << "Warning: Failed to parse area spec file, using default extraction\n\n";
      }
    }
    
    // Create the converter
    NeuraToSExpr converter;
    
    // First pass: collect all S-expressions from the DFG
    std::vector<std::string> allSexprs;
    std::vector<Operation*> neuraOps;  // Keep track of operations
    
    module.walk([&](Operation *op) {
      if (op->getDialect() && 
          op->getDialect()->getNamespace() == "neura") {
            if (!op->use_empty()) {
              return;  // Skip ops that have uses (not DFG outputs)
            }
        std::string sexpr = converter.convert(op);
        if (!sexpr.empty()) {
          allSexprs.push_back(sexpr);
          neuraOps.push_back(op);
        }
      }
    });
    
    llvm::errs() << "=== Egg Equality Saturation Pass ===\n";
    llvm::errs() << "Collected " << allSexprs.size() << " S-expressions from DFG:\n";
    for (size_t i = 0; i < allSexprs.size(); ++i) {
      llvm::errs() << "  [" << i << "] " << allSexprs[i] << "\n";
    }
    llvm::errs() << "\n";
    
    // Extract fusion rules from the DFG patterns
    // minFrequency = 2 means pattern must appear at least twice
    auto patterns = RewriteRuleGenerator::extractPatterns(allSexprs, 2);
    
    llvm::errs() << "Extracted " << patterns.size() << " patterns with frequency >= 2:\n";
    for (size_t i = 0; i < patterns.size(); ++i) {
      llvm::errs() << "  [" << i << "] Pattern: " << patterns[i].pattern << "\n";
      llvm::errs() << "       Frequency: " << patterns[i].frequency 
                   << ", Op count: " << patterns[i].opCount << "\n";
    }
    llvm::errs() << "\n";
    
    // Generate fusion rules from patterns
    auto fusionRules = RewriteRuleGenerator::generateFusionRulesFromPatterns(patterns);
    
    // Also add basic algebraic rules for optimization
    auto algebraicRules = RewriteRuleGenerator::getAlgebraicIdentityRules();
    auto commutativityRules = RewriteRuleGenerator::getCommutativityRules();
    auto associativityRules = RewriteRuleGenerator::getAssociativityRules();
    
    // Combine all rules
    std::vector<RewriteRule> allRules;
    allRules.insert(allRules.end(), fusionRules.begin(), fusionRules.end());
    allRules.insert(allRules.end(), algebraicRules.begin(), algebraicRules.end());
    allRules.insert(allRules.end(), commutativityRules.begin(), commutativityRules.end());
    allRules.insert(allRules.end(), associativityRules.begin(), associativityRules.end());
    
    llvm::errs() << "Generated " << fusionRules.size() << " fusion rules\n";
    llvm::errs() << "Total rules (including algebraic): " << allRules.size() << "\n\n";
    
    // Print fusion rules
    llvm::errs() << "Fusion rules:\n";
    for (size_t i = 0; i < fusionRules.size(); ++i) {
      llvm::errs() << "  " << fusionRules[i].name << ":\n";
      llvm::errs() << "    " << fusionRules[i].lhs << "\n";
      llvm::errs() << "    -> " << fusionRules[i].rhs << "\n";
    }
    llvm::errs() << "\n";
    
    // Configure egg
    EggConfig config;
    config.iterLimit = 30;
    config.nodeLimit = 10000;
    config.timeLimitSecs = 60;
    
    // Build a map of fused pattern info for reconstruction
    llvm::StringMap<FusedPatternInfo> fusedPatternMap;
    for (const auto& pattern : patterns) {
      std::string fusedName = "fused";
      for (const auto& op : pattern.operators) {
        std::string sanitized = op;
        if (sanitized == "+") sanitized = "add";
        else if (sanitized == "-") sanitized = "sub";
        else if (sanitized == "*") sanitized = "mul";
        else if (sanitized == "/") sanitized = "div";
        fusedName += "_" + sanitized;
      }
      
      FusedPatternInfo info;
      info.patternName = fusedName;
      info.originalPattern = pattern.pattern;
      info.frequency = pattern.frequency;
      info.operators = pattern.operators;
      fusedPatternMap[fusedName] = info;
    }
    
    // Run equality saturation on each expression
    llvm::errs() << "=== Running Equality Saturation ===\n";
    if (useCycleAwareExtraction) {
      llvm::errs() << "(Using cycle-aware extraction with area optimization)\n";
    }
    llvm::errs() << "\n";
    
    std::vector<std::string> optimizedExprs;
    for (size_t i = 0; i < allSexprs.size(); ++i) {
      const std::string& expr = allSexprs[i];
      
      llvm::errs() << "[" << i << "] Input:  " << expr << "\n";
      
      if (useCycleAwareExtraction) {
        // Run cycle-aware saturation with area optimization
        CycleAwareSaturationResult result = runCycleAwareSaturation(expr, allRules, areaMap, config);
        
        if (result.isSuccess()) {
          llvm::errs() << "    Output: " << result.resultExpr << "\n";
          llvm::errs() << "    (iterations=" << result.iterations 
                       << ", egraph_size=" << result.egraphSize 
                       << ", saturated=" << (result.saturated ? "yes" : "no") << ")\n";
          llvm::errs() << "    (cycle_nodes=" << result.cycleNodeCount
                       << ", off_cycle_area=" << result.offCycleArea
                       << ", ast_size=" << result.astSize << ")\n";
          optimizedExprs.push_back(result.resultExpr);
        } else {
          llvm::errs() << "    Error: " << result.errorMsg << "\n";
          optimizedExprs.push_back(expr);  // Keep original on error
        }
      } else {
        // Run standard saturation
        SaturationResult result = runSaturation(expr, allRules, config);
        
        if (result.isSuccess()) {
          llvm::errs() << "    Output: " << result.resultExpr << "\n";
          llvm::errs() << "    (iterations=" << result.iterations 
                       << ", egraph_size=" << result.egraphSize 
                       << ", saturated=" << (result.saturated ? "yes" : "no") << ")\n";
          optimizedExprs.push_back(result.resultExpr);
        } else {
          llvm::errs() << "    Error: " << result.errorMsg << "\n";
          optimizedExprs.push_back(expr);  // Keep original on error
        }
      }
    }
    
    llvm::errs() << "\n=== Optimization Summary ===\n";
    
    // Count how many expressions were changed
    size_t changedCount = 0;
    for (size_t i = 0; i < allSexprs.size(); ++i) {
      if (allSexprs[i] != optimizedExprs[i]) {
        changedCount++;
        llvm::errs() << "Changed [" << i << "]:\n";
        llvm::errs() << "  Before: " << allSexprs[i] << "\n";
        llvm::errs() << "  After:  " << optimizedExprs[i] << "\n";
      }
    }
    llvm::errs() << "\nTotal: " << changedCount << "/" << allSexprs.size() 
                 << " expressions optimized\n\n";
    
    // === IR Reconstruction with Multi-Output Fused Ops ===
    llvm::errs() << "=== IR Reconstruction ===\n";
    
    // Find the function/kernel containing these operations
    Operation* parentOp = nullptr;
    if (!neuraOps.empty() && neuraOps[0]) {
      parentOp = neuraOps[0]->getParentOp();
    }
    
    if (!parentOp) {
      llvm::errs() << "Error: Could not find parent operation for reconstruction\n";
      return;
    }
    
    // Get the parent region
    Region* parentRegion = nullptr;
    if (auto kernelOp = dyn_cast<neura::KernelOp>(parentOp)) {
      parentRegion = &kernelOp.getBody();
    } else if (auto funcOp = dyn_cast<func::FuncOp>(parentOp)) {
      parentRegion = &funcOp.getBody();
    }
    
    if (!parentRegion || parentRegion->empty()) {
      llvm::errs() << "Error: Could not find parent region for reconstruction\n";
      return;
    }
    
    Location loc = parentOp->getLoc();
    
    // Build a map from operation to its index
    std::map<Operation*, size_t> opToIndex;
    for (size_t i = 0; i < neuraOps.size(); ++i) {
      if (neuraOps[i]) {
        opToIndex[neuraOps[i]] = i;
      }
    }
    
    // Identify fusion groups: find operations whose optimized expr starts with (fused ...)
    // and collect all operations that are part of the same fusion
    struct FusionGroup {
      std::string patternName;
      Operation* rootOp;                    // The root operation of this fusion
      std::vector<Operation*> opsInGroup;   // All operations in topological order
      SmallVector<Value> externalInputs;    // Inputs from outside the group
      SmallVector<Value> externalOutputs;   // Results used outside the group
      int64_t frequency;
      size_t rootIndex;
    };
    
    std::vector<FusionGroup> fusionGroups;
    
    // First pass: collect all potential fusion groups without filtering
    for (size_t i = 0; i < neuraOps.size() && i < optimizedExprs.size(); ++i) {
      if (!neuraOps[i]) continue;
      
      const std::string& optimizedExpr = optimizedExprs[i];
      
      // Check if this expression contains (fused ...) anywhere
      // The fused pattern may appear as a subexpression, not just at the root
      size_t fusedPos = optimizedExpr.find("(fused ");
      if (fusedPos != std::string::npos) {
        // Extract the pattern name (relative to fusedPos)
        size_t nameStart = fusedPos + 7;  // Skip "(fused "
        size_t nameEnd = optimizedExpr.find_first_of(" )", nameStart);
        std::string patternName = optimizedExpr.substr(nameStart, nameEnd - nameStart);
        
        llvm::errs() << "  [" << i << "] Found fused pattern: " << patternName << "\n";
        
        FusionGroup group;
        group.patternName = patternName;
        group.rootOp = neuraOps[i];
        group.rootIndex = i;
        group.frequency = 1;
        
        if (fusedPatternMap.count(patternName)) {
          group.frequency = fusedPatternMap[patternName].frequency;
        }
        
        // NEW LOGIC: The fused pattern is a subexpression of the current op.
        // We need to trace back from the operands of the current op (not the op itself)
        // to find the operations that should be fused.
        std::set<Operation*> opsInFusion;
        std::queue<Operation*> worklist;
        
        // Start from the operands of the current operation
        for (Value operand : neuraOps[i]->getOperands()) {
          if (Operation* defOp = operand.getDefiningOp()) {
            worklist.push(defOp);
          }
        }
        
        while (!worklist.empty()) {
          Operation* op = worklist.front();
          worklist.pop();
          
          if (opsInFusion.count(op)) continue;
          
          // Only include neura ops
          if (!op->getDialect() || op->getDialect()->getNamespace() != "neura") 
            continue;
          
          llvm::StringRef opName = op->getName().stripDialect();
          
          // Skip leaf operations (grant_once, reserve) - they stay outside fusion
          if (opName == "grant_once" || opName == "reserve") continue;
          
          // Include this operation in the fusion
          opsInFusion.insert(op);
          
          // Trace operands
          for (Value operand : op->getOperands()) {
            if (Operation* defOp = operand.getDefiningOp()) {
              if (!opsInFusion.count(defOp)) {
                worklist.push(defOp);
              }
            }
          }
        }
        
        // Sort operations in topological order
        std::vector<Operation*> sortedOps;
        std::set<Operation*> visited;
        
        std::function<void(Operation*)> topoSort = [&](Operation* op) {
          if (visited.count(op) || !opsInFusion.count(op)) return;
          visited.insert(op);
          
          for (Value operand : op->getOperands()) {
            if (Operation* defOp = operand.getDefiningOp()) {
              if (opsInFusion.count(defOp)) {
                topoSort(defOp);
              }
            }
          }
          sortedOps.push_back(op);
        };
        
        for (Operation* op : opsInFusion) {
          topoSort(op);
        }
        
        group.opsInGroup = sortedOps;
        
        llvm::errs() << "    -> opsInGroup size: " << sortedOps.size() << "\n";
        
        // Identify external inputs (values defined outside the fusion)
        llvm::SetVector<Value> inputSet;
        for (Operation* op : sortedOps) {
          for (Value operand : op->getOperands()) {
            Operation* defOp = operand.getDefiningOp();
            if (!defOp || !opsInFusion.count(defOp)) {
              inputSet.insert(operand);
            }
          }
        }
        group.externalInputs.assign(inputSet.begin(), inputSet.end());
        
        // Identify external outputs (results used outside the fusion)
        llvm::SetVector<Value> outputSet;
        for (Operation* op : sortedOps) {
          for (Value result : op->getResults()) {
            for (Operation* user : result.getUsers()) {
              if (!opsInFusion.count(user)) {
                outputSet.insert(result);
                break;
              }
            }
          }
        }
        group.externalOutputs.assign(outputSet.begin(), outputSet.end());
        
        fusionGroups.push_back(group);
      }
    }
    
    // Second pass: filter out fusion groups that are subsets of larger groups
    // A group A is a subset of group B if all ops in A are also in B
    std::vector<bool> keepGroup(fusionGroups.size(), true);
    for (size_t i = 0; i < fusionGroups.size(); ++i) {
      if (!keepGroup[i]) continue;
      
      std::set<Operation*> opsSetI(fusionGroups[i].opsInGroup.begin(), 
                                    fusionGroups[i].opsInGroup.end());
      
      for (size_t j = 0; j < fusionGroups.size(); ++j) {
        if (i == j || !keepGroup[j]) continue;
        
        std::set<Operation*> opsSetJ(fusionGroups[j].opsInGroup.begin(),
                                      fusionGroups[j].opsInGroup.end());
        
        // Check if group j is a proper subset of group i
        if (opsSetJ.size() < opsSetI.size()) {
          bool isSubset = true;
          for (Operation* op : opsSetJ) {
            if (!opsSetI.count(op)) {
              isSubset = false;
              break;
            }
          }
          if (isSubset) {
            // Group j is subset of group i, skip group j
            keepGroup[j] = false;
          }
        }
      }
    }
    
    // Build filtered list of fusion groups
    std::vector<FusionGroup> filteredGroups;
    for (size_t i = 0; i < fusionGroups.size(); ++i) {
      if (keepGroup[i]) {
        filteredGroups.push_back(fusionGroups[i]);
      }
    }
    fusionGroups = std::move(filteredGroups);
    
    llvm::errs() << "Found " << fusionGroups.size() << " fusion groups (after filtering)\n";
    
    // Sort fusion groups by the position of their first operation in the block
    // This ensures we process groups in program order to maintain SSA dominance
    std::sort(fusionGroups.begin(), fusionGroups.end(), 
      [](const FusionGroup& a, const FusionGroup& b) {
        if (a.opsInGroup.empty() || b.opsInGroup.empty()) return false;
        Block* blockA = a.opsInGroup.front()->getBlock();
        Block* blockB = b.opsInGroup.front()->getBlock();
        if (blockA != blockB) return blockA < blockB;  // Different blocks, arbitrary order
        
        // Find the earliest operation in each group
        Operation* earliestA = a.opsInGroup.front();
        Operation* earliestB = b.opsInGroup.front();
        for (Operation* op : a.opsInGroup) {
          if (op->isBeforeInBlock(earliestA)) earliestA = op;
        }
        for (Operation* op : b.opsInGroup) {
          if (op->isBeforeInBlock(earliestB)) earliestB = op;
        }
        return earliestA->isBeforeInBlock(earliestB);
      });
    
    // Collect all operations that are part of any fusion group
    std::set<Operation*> allFusedOps;
    for (const auto& group : fusionGroups) {
      for (Operation* op : group.opsInGroup) {
        allFusedOps.insert(op);
      }
    }
    
    // Create fused_op for each fusion group
    for (auto& group : fusionGroups) {
      if (group.opsInGroup.empty()) continue;
      
      // Re-collect external inputs based on current IR state
      // (previous fused_ops may have changed operand values)
      std::set<Operation*> opsInFusion(group.opsInGroup.begin(), group.opsInGroup.end());
      llvm::SetVector<Value> inputSet;
      for (Operation* op : group.opsInGroup) {
        for (Value operand : op->getOperands()) {
          Operation* defOp = operand.getDefiningOp();
          if (!defOp || !opsInFusion.count(defOp)) {
            inputSet.insert(operand);
          }
        }
      }
      group.externalInputs.assign(inputSet.begin(), inputSet.end());
      
      // Re-collect external outputs
      llvm::SetVector<Value> outputSet;
      for (Operation* op : group.opsInGroup) {
        for (Value result : op->getResults()) {
          for (Operation* user : result.getUsers()) {
            if (!opsInFusion.count(user)) {
              outputSet.insert(result);
              break;
            }
          }
        }
      }
      group.externalOutputs.assign(outputSet.begin(), outputSet.end());
      
      // If this group has no ops or no outputs, skip it
      if (group.opsInGroup.empty() || group.externalOutputs.empty()) {
        continue;
      }
      
      llvm::errs() << "Creating fused_op for pattern: " << group.patternName << "\n";
      llvm::errs() << "  Ops in group: " << group.opsInGroup.size() << "\n";
      llvm::errs() << "  External inputs: " << group.externalInputs.size() << "\n";
      llvm::errs() << "  External outputs: " << group.externalOutputs.size() << "\n";
      
      // Find the insertion point with correct dominance:
      // 1. Must be AFTER all external inputs are defined
      // 2. Must be BEFORE all external output users (outside the fusion group)
      // 
      // Strategy: Find the earliest user of any external output outside the group,
      // then find the latest defining op of inputs that is before that user.
      Block* block = group.opsInGroup.front()->getBlock();
      
      // First, find the earliest user of external outputs outside the group
      std::set<Operation*> opsInThisGroup(group.opsInGroup.begin(), group.opsInGroup.end());
      Operation* earliestUser = nullptr;
      for (Value output : group.externalOutputs) {
        for (Operation* user : output.getUsers()) {
          if (opsInThisGroup.count(user)) continue;  // Skip users inside the group
          if (user->getBlock() != block) continue;   // Skip users in different blocks
          if (!earliestUser || user->isBeforeInBlock(earliestUser)) {
            earliestUser = user;
          }
        }
      }
      
      // Find the insertion point: should be after all inputs are defined,
      // but before the earliest external user
      Operation* insertPoint = nullptr;
      
      // Find the latest position among defining ops of EXTERNAL inputs
      for (Value input : group.externalInputs) {
        if (Operation* defOp = input.getDefiningOp()) {
          if (defOp->getBlock() == block) {
            if (!insertPoint || insertPoint->isBeforeInBlock(defOp)) {
              insertPoint = defOp;
            }
          }
        }
      }
      
      // If we have an earliest user, we need to insert before it
      // But still after all input definitions
      if (earliestUser && insertPoint) {
        // Verify that insertPoint is before earliestUser
        if (!insertPoint->isBeforeInBlock(earliestUser)) {
          // This shouldn't happen in well-formed IR, but let's handle it
          llvm::errs() << "  Warning: Input definition after external user\n";
        }
      }
      
      // If no insert point found (e.g., all inputs are block arguments), 
      // use the earliest op in the group and insert before it
      if (!insertPoint) {
        insertPoint = group.opsInGroup.front();
        for (Operation* op : group.opsInGroup) {
          if (op->isBeforeInBlock(insertPoint)) {
            insertPoint = op;
          }
        }
      }
      
      // Insert AFTER insertPoint (which is the latest input definition)
      OpBuilder builder(insertPoint->getBlock(), std::next(Block::iterator(insertPoint)));
      
      // Collect output types
      SmallVector<Type> outputTypes;
      for (Value output : group.externalOutputs) {
        outputTypes.push_back(output.getType());
      }
      
      // Create the fused_op with multiple outputs
      auto fusedOp = builder.create<neura::FusedOp>(
          loc,
          TypeRange(outputTypes),
          group.externalInputs,
          builder.getI64IntegerAttr(group.rootIndex),
          builder.getStringAttr(group.patternName),
          builder.getI64IntegerAttr(group.frequency));
      
      // Create the body region with block arguments for inputs
      Block* body = builder.createBlock(&fusedOp.getBody());
      for (Value input : group.externalInputs) {
        body->addArgument(input.getType(), loc);
      }
      
      // Build mapping from external inputs to block arguments
      IRMapping mapping;
      for (size_t j = 0; j < group.externalInputs.size(); ++j) {
        mapping.map(group.externalInputs[j], body->getArgument(j));
      }
      
      // Clone operations into the body region in topological order
      builder.setInsertionPointToEnd(body);
      for (Operation* op : group.opsInGroup) {
        Operation* clonedOp = builder.clone(*op, mapping);
        // Map results of original op to results of cloned op
        for (size_t j = 0; j < op->getNumResults(); ++j) {
          mapping.map(op->getResult(j), clonedOp->getResult(j));
        }
      }
      
      // Add yield with all external outputs (mapped to cloned values)
      SmallVector<Value> yieldValues;
      for (Value output : group.externalOutputs) {
        yieldValues.push_back(mapping.lookup(output));
      }
      builder.create<neura::YieldOp>(loc, yieldValues);
      
      // Replace uses of external outputs with fused_op results
      // Important: Replace ALL uses outside this specific fusion group
      // Note: opsInThisGroup was already defined above
      for (size_t j = 0; j < group.externalOutputs.size(); ++j) {
        Value originalOutput = group.externalOutputs[j];
        Value fusedResult = fusedOp.getResult(j);
        
        // Replace uses outside THIS fusion group - including uses in other fusion groups
        originalOutput.replaceUsesWithIf(fusedResult, [&](OpOperand& use) {
          Operation* user = use.getOwner();
          // Skip uses inside THIS fusion group (they were handled by cloning)
          if (opsInThisGroup.count(user)) return false;
          // Skip the yield we just created
          if (llvm::isa<neura::YieldOp>(user) && user->getParentOp() == fusedOp) return false;
          // Replace all other uses
          return true;
        });
      }
    }
    
    // Erase all original operations (after all fused_ops are created)
    // Only erase operations that have NO remaining uses
    for (auto& group : fusionGroups) {
      // Process in reverse topological order
      for (auto it = group.opsInGroup.rbegin(); it != group.opsInGroup.rend(); ++it) {
        Operation* op = *it;
        
        // Check if all results are now unused
        bool canErase = true;
        for (Value result : op->getResults()) {
          if (!result.use_empty()) {
            canErase = false;
            break;
          }
        }
        
        if (canErase) {
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
