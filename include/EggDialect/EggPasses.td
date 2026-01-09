// EggPasses.td - Passes for the Egg dialect

#ifndef EGG_PASSES_TD
#define EGG_PASSES_TD

include "mlir/Pass/PassBase.td"

//=========================================================//
// Passes for the Egg dialect
//=========================================================//

def ProcessNeura : Pass<"egg-process-neura", "ModuleOp"> {
  let summary = "Process Neura dialect with Egg-based optimizations";
  let description = [{
    This pass applies equality saturation based optimizations
    on Neura dialect operations.
  }];
  let constructor = "egg::createProcessNeuraPass()";
}

#endif // EGG_PASSES_TD
