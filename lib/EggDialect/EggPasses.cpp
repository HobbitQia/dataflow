// EggPasses.cpp - Egg dialect passes implementation
#include "EggDialect/EggDialect.h"
#include "EggDialect/EggOps.h"
#include "EggDialect/EggSaturation.h"
#include "EggDialect/NeuraToSExpr.h"
#include "EggDialect/RewriteRules.h"
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
    
    module.walk([&](Operation *op) {
      if (op->getDialect() && 
          op->getDialect()->getNamespace() == "neura") {
        std::string sexpr = converter.convert(op);
        if (!sexpr.empty()) {
          allSexprs.push_back(sexpr);
        }
      }
    });
    
    llvm::errs() << "Collected " << allSexprs.size() << " S-expressions from DFG\n\n";
    
    // Extract fusion rules from the DFG patterns
    // minFrequency = 2 means pattern must appear at least twice
    auto patterns = RewriteRuleGenerator::extractPatterns(allSexprs, 2);
    
    llvm::errs() << "Extracted " << patterns.size() << " patterns with frequency >= 2:\n";
    for (size_t i = 0; i < patterns.size(); ++i) {
      llvm::errs() << "  [" << i << "] Pattern: " << patterns[i].pattern << "\n";
      llvm::errs() << "       Frequency: " << patterns[i].frequency << "\n";
      llvm::errs() << "       Op count: " << patterns[i].opCount << "\n";
      llvm::errs() << "       Operators: ";
      for (const auto& op : patterns[i].operators) {
        llvm::errs() << op << " ";
      }
      llvm::errs() << "\n";
    }
    llvm::errs() << "\n";
    
    // Generate fusion rules from patterns
    auto fusionRules = RewriteRuleGenerator::generateFusionRulesFromPatterns(patterns);
    
    llvm::errs() << "Generated " << fusionRules.size() << " fusion rules:\n";
    for (size_t i = 0; i < fusionRules.size(); ++i) {
      llvm::errs() << "  [" << i << "] " << fusionRules[i].name << ":\n";
      llvm::errs() << "       " << fusionRules[i].lhs << "\n";
      llvm::errs() << "    -> " << fusionRules[i].rhs << "\n";
    }
    llvm::errs() << "\n";
    
    EggConfig config;
    config.iterLimit = 30;
    config.nodeLimit = 10000;
    
    // Second pass: print all S-expressions (for debugging)
    llvm::errs() << "All S-expressions:\n";
    for (size_t i = 0; i < allSexprs.size(); ++i) {
      llvm::errs() << "  [" << i << "] " << allSexprs[i] << "\n";
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
