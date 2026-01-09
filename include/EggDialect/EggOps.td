// EggOps.td - Egg dialect operations
#ifndef EGG_OPS_TD
#define EGG_OPS_TD

include "EggDialect.td"
include "mlir/IR/OpBase.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

// Base class for Egg dialect operations
class Egg_Op<string mnemonic, list<Trait> traits = []> :
    Op<EggDialect, mnemonic, traits>;

// Placeholder for future operations
// Add operations here as needed

#endif // EGG_OPS_TD
