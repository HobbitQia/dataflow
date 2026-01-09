// EggPasses.cpp - Egg dialect passes implementation
#include "EggDialect/EggDialect.h"
#include "EggDialect/EggOps.h"
#include "EggDialect/EggSaturation.h"
#include "EggDialect/NeuraToSExpr.h"
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
    
    // Example: Define some rewrite rules for optimization
    // These can be customized based on the Neura dialect operations
    std::vector<RewriteRule> rules = {
      // Arithmetic simplifications
      RewriteRule("add-0", "(+ ?x 0)", "?x"),
      RewriteRule("mul-1", "(* ?x 1)", "?x"),
      RewriteRule("mul-0", "(* ?x 0)", "0"),
      
      // Commutativity (bidirectional)
      RewriteRule("commute-add", "(+ ?a ?b)", "(+ ?b ?a)", true),
      RewriteRule("commute-mul", "(* ?a ?b)", "(* ?b ?a)", true),
      
      // Associativity
      RewriteRule("assoc-add", "(+ ?a (+ ?b ?c))", "(+ (+ ?a ?b) ?c)", true),
      RewriteRule("assoc-mul", "(* ?a (* ?b ?c))", "(* (* ?a ?b) ?c)", true),
      
      // Distributivity
      RewriteRule("distribute", "(* ?a (+ ?b ?c))", "(+ (* ?a ?b) (* ?a ?c))", true),
      
      // Floating-point rules
      RewriteRule("fadd-0", "(fadd ?x 0.0)", "?x"),
      RewriteRule("fmul-1", "(fmul ?x 1.0)", "?x"),
      RewriteRule("fmul-0", "(fmul ?x 0.0)", "0.0"),
      RewriteRule("commute-fadd", "(fadd ?a ?b)", "(fadd ?b ?a)", true),
      RewriteRule("commute-fmul", "(fmul ?a ?b)", "(fmul ?b ?a)", true),
      
      // Fused multiply-add optimization
      RewriteRule("fma-intro", "(fadd (fmul ?a ?b) ?c)", "(fma ?a ?b ?c)"),
    };
    
    EggConfig config;
    config.iterLimit = 30;
    config.nodeLimit = 10000;
    
    // Create the converter
    NeuraToSExpr converter;
    
    // Walk through the module and process Neura operations
    module.walk([&](Operation *op) {
      // Check if operation is from Neura dialect
      if (op->getDialect() && 
          op->getDialect()->getNamespace() == "neura") {
        
        // Convert Neura operation to S-expression format
        std::string sexpr = converter.convert(op);
        
        if (!sexpr.empty()) {
          llvm::errs() << "Neura operation: " << op->getName() << "\n";
          llvm::errs() << "  S-expression: " << sexpr << "\n";
          
          // Get the value mapping for this operation
          const auto &varMap = converter.getVarMap();
          
          llvm::errs() << "  Variable mappings:\n";
          for (const auto &entry : varMap) {
            llvm::errs() << "    " << entry.getKey() << " -> Value\n";
          }
          
          // Run equality saturation (optional, can be enabled later)
          // EggResult result = runEggSaturation(sexpr, rules, config);
          // if (result.success) {
          //   llvm::errs() << "  Optimized: " << result.bestExpr << "\n";
          // }
        }
      }
    });
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
