// EggDialect.td - TableGen description of the Egg dialect.
#ifndef EGG_DIALECT_TD
#define EGG_DIALECT_TD

include "mlir/IR/OpBase.td"
include "mlir/IR/DialectBase.td"
include "mlir/IR/AttrTypeBase.td"

// Define the Egg dialect
def EggDialect : Dialect {
  let name = "egg";
  let cppNamespace = "::mlir::egg";
  
  let summary = "A dialect for Egg-based optimizations.";
  let description = [{
    This dialect is used for representing Egg operations and performing
    equality saturation based optimizations on Neura dialect.
  }];
  
  let useDefaultTypePrinterParser = 1;
  let useDefaultAttributePrinterParser = 1;
}

#endif // EGG_DIALECT_TD
