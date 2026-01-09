// Egg.cpp - Egg dialect implementation
#include "EggDialect/EggDialect.h"
#include "EggDialect/EggOps.h"

#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"

using namespace mlir;
using namespace mlir::egg;

//===----------------------------------------------------------------------===//
// Egg dialect
//===----------------------------------------------------------------------===//

#include "EggDialect/EggDialect.cpp.inc"

void EggDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "EggDialect/EggOps.cpp.inc"
      >();
}

// Default implementations for type/attribute printing and parsing
// These are required even when using useDefaultTypePrinterParser/
// useDefaultAttributePrinterParser in some MLIR versions

Attribute EggDialect::parseAttribute(DialectAsmParser &parser, Type type) const {
  // No custom attributes defined for Egg dialect yet
  parser.emitError(parser.getNameLoc(), "unknown egg attribute");
  return {};
}

void EggDialect::printAttribute(Attribute attr, DialectAsmPrinter &printer) const {
  // No custom attributes defined for Egg dialect yet
  llvm_unreachable("unknown egg attribute kind");
}

Type EggDialect::parseType(DialectAsmParser &parser) const {
  // No custom types defined for Egg dialect yet
  parser.emitError(parser.getNameLoc(), "unknown egg type");
  return {};
}

void EggDialect::printType(Type type, DialectAsmPrinter &printer) const {
  // No custom types defined for Egg dialect yet
  llvm_unreachable("unknown egg type kind");
}
