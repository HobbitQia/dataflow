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
           "Operations not specified default to area 0.">,
    Option<"minPatternFrequency", "min-pattern-frequency", "size_t", /*default=*/"2",
           "Minimum frequency for a pattern to be considered for fusion. "
           "Patterns appearing fewer times than this threshold are ignored.">,
    Option<"maxPatternArea", "max-pattern-area", "size_t", /*default=*/"50000",
           "Maximum area for a pattern to be considered for fusion. "
           "Patterns with area exceeding this threshold are ignored.">,
    Option<"maxPatternOps", "max-pattern-ops", "size_t", /*default=*/"20",
           "Maximum number of operations for a pattern to be considered for fusion. "
           "Patterns with more operations than this threshold are ignored.">
  ];
}

#endif // EGG_PASSES_TD
