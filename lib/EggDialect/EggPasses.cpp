// EggPasses.cpp - Egg dialect passes implementation
#include "EggDialect/EggDialect.h"
#include "EggDialect/EggOps.h"
#include "EggDialect/EggSaturation.h"
#include "EggDialect/NeuraToSExpr.h"
#include "EggDialect/RewriteRules.h"
#include "EggDialect/SExprToNeura.h"
#include "NeuraDialect/NeuraDialect.h"
#include "NeuraDialect/NeuraOps.h"

#include "mlir/Pass/Pass.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

#include "llvm/Support/raw_ostream.h"

namespace mlir {
namespace egg {

#define GEN_PASS_DEF_PROCESSNEURA
#include "EggDialect/EggPasses.h.inc"

//===----------------------------------------------------------------------===//
// ProcessNeura Pass
//===----------------------------------------------------------------------===//

namespace {

struct ProcessNeuraPass : public impl::ProcessNeuraBase<ProcessNeuraPass> {
  void runOnOperation() override {
    ModuleOp module = getOperation();
    
    // Create the converter
    NeuraToSExpr converter;
    
    // First pass: collect all S-expressions from the DFG
    std::vector<std::string> allSexprs;
    std::vector<Operation*> neuraOps;  // Keep track of operations
    
    module.walk([&](Operation *op) {
      if (op->getDialect() && 
          op->getDialect()->getNamespace() == "neura") {
        std::string sexpr = converter.convert(op);
        if (!sexpr.empty()) {
          allSexprs.push_back(sexpr);
          neuraOps.push_back(op);
        }
      }
    });
    
    llvm::errs() << "=== Egg Equality Saturation Pass ===\n";
    llvm::errs() << "Collected " << allSexprs.size() << " S-expressions from DFG\n\n";
    
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
    llvm::errs() << "=== Running Equality Saturation ===\n\n";
    
    std::vector<std::string> optimizedExprs;
    for (size_t i = 0; i < allSexprs.size(); ++i) {
      const std::string& expr = allSexprs[i];
      
      llvm::errs() << "[" << i << "] Input:  " << expr << "\n";
      
      // Run egg saturation
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
    
    // === IR Reconstruction ===
    // Create SExprToNeura converter to reconstruct IR from optimized S-expressions
    llvm::errs() << "=== IR Reconstruction ===\n";
    
    // Check for fused patterns in optimized expressions
    llvm::errs() << "=== Fused Patterns Detected ===\n";
    
    // Look for "(fused " in optimized expressions (new format)
    for (size_t i = 0; i < optimizedExprs.size(); ++i) {
      const std::string& expr = optimizedExprs[i];
      
      // Check for (fused pattern_name ...) format
      size_t fusedPos = expr.find("(fused ");
      if (fusedPos != std::string::npos) {
        // Extract pattern name - it's the first token after "fused "
        size_t nameStart = fusedPos + 7;  // length of "(fused "
        size_t nameEnd = expr.find_first_of(" )", nameStart);
        if (nameEnd != std::string::npos) {
          std::string patternName = expr.substr(nameStart, nameEnd - nameStart);
          
          llvm::errs() << "Found fused pattern in expr[" << i << "]: " << patternName << "\n";
          llvm::errs() << "  Expression: " << expr << "\n";
          
          // Look up pattern info if available
          if (fusedPatternMap.count(patternName)) {
            const auto& info = fusedPatternMap[patternName];
            llvm::errs() << "  Original pattern: " << info.originalPattern << "\n";
            llvm::errs() << "  Frequency: " << info.frequency << "\n";
          }
          
          // Create the fused_op for this pattern
          if (i < neuraOps.size() && neuraOps[i]) {
            Operation* originalOp = neuraOps[i];
            OpBuilder builder(originalOp);
            Location loc = originalOp->getLoc();
            
            // Create SExprToNeura converter
            SExprToNeura sexprToNeura(builder, loc);
            
            // Set variable mapping from the original converter
            sexprToNeura.setVarMap(converter.getVarMap());
            
            // Register fused patterns
            for (const auto& [name, info] : fusedPatternMap) {
              sexprToNeura.registerFusedPattern(name.str(), info);
            }
            
            llvm::errs() << "  Creating neura.fused_op with pattern_name=\"" 
                         << patternName << "\"\n\n";
            
            // Note: Full reconstruction would require:
            // 1. Parsing S-expression arguments
            // 2. Resolving variable bindings
            // 3. Building the operation
            // For now, we just demonstrate detection
          }
        }
      }
    }
    
    // Also check old format (fused_name ...) for backward compatibility  
    for (const auto& expr : optimizedExprs) {
      for (const auto& [fusedName, info] : fusedPatternMap) {
        std::string fusedNameStr = fusedName.str();
        // Skip if we already detected with new format
        if (expr.find("(fused " + fusedNameStr) != std::string::npos) continue;
        
        if (expr.find("(" + fusedNameStr) != std::string::npos) {
          llvm::errs() << "Found fused pattern (old format): " << fusedNameStr << "\n";
          llvm::errs() << "  Original pattern: " << info.originalPattern << "\n";
          llvm::errs() << "  Frequency: " << info.frequency << "\n";
          llvm::errs() << "  Would create: neura.fused_op with pattern_name=\"" 
                       << fusedNameStr << "\"\n\n";
        }
      }
    }
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
