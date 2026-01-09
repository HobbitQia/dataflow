// EggOps.cpp - Egg dialect operations
#include "EggDialect/EggOps.h"
#include "EggDialect/EggDialect.h"

#include "mlir/IR/OpImplementation.h"
#include "mlir/IR/Builders.h"

using namespace mlir;
using namespace mlir::egg;

//===----------------------------------------------------------------------===//
// Egg operations
//===----------------------------------------------------------------------===//

#define GET_OP_CLASSES
#include "EggDialect/EggOps.cpp.inc"
