// EggOps.h - Egg dialect operations
#ifndef EGG_OPS_H
#define EGG_OPS_H

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#define GET_OP_CLASSES
#include "EggDialect/EggOps.h.inc"

#endif // EGG_OPS_H
