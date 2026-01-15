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
    
    The pass supports two-phase extraction:
    - Phase 1: Minimize nodes on cycles (critical path optimization)
    - Phase 2: Minimize total area for non-cycle nodes
    
    Use --area-spec to provide a YAML file mapping operation names to their area costs.
    Operations not specified in the YAML file default to area 0.
  }];
  let constructor = "egg::createProcessNeuraPass()";
  
  let options = [
    Option<"areaSpecFile", "area-spec", "std::string", /*default=*/"\"\"",
           "Path to YAML file specifying area costs for operations. "
           "Format: op_name: area_value (one per line). "
           "Operations not specified default to area 0.">
  ];
}

#endif // EGG_PASSES_TD
