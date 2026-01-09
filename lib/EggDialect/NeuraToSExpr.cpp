// NeuraToSExpr.cpp - Convert Neura dialect IR to S-expression for egg
#include "EggDialect/NeuraToSExpr.h"
#include "NeuraDialect/NeuraOps.h"

#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/Operation.h"

#include "llvm/Support/raw_ostream.h"

using namespace mlir;
using namespace mlir::egg;

std::string NeuraToSExpr::getOrCreateVar(Value value) {
  auto it = valueToVar.find(value);
  if (it != valueToVar.end()) {
    return it->second;
  }
  
  std::string varName = "v" + std::to_string(varCounter++);
  valueToVar[value] = varName;
  varToValue[varName] = value;
  return varName;
}

llvm::StringRef NeuraToSExpr::getOperatorName(Operation *op) {
  llvm::StringRef opName = op->getName().stripDialect();
  
  // Map Neura operations to S-expression operators
  // Arithmetic operations
  if (opName == "add") return "+";
  if (opName == "sub") return "-";
  if (opName == "mul") return "*";
  if (opName == "div") return "/";
  if (opName == "rem") return "%";
  
  // Floating-point operations
  if (opName == "fadd") return "fadd";
  if (opName == "fsub") return "fsub";
  if (opName == "fmul") return "fmul";
  if (opName == "fdiv") return "fdiv";
  if (opName == "fneg") return "fneg";
  if (opName == "fmax") return "fmax";
  if (opName == "fmin") return "fmin";
  
  // Bitwise operations
  if (opName == "and") return "and";
  if (opName == "or") return "or";
  if (opName == "not") return "not";
  if (opName == "shl") return "shl";
  
  // Comparison operations
  if (opName == "icmp") return "icmp";
  if (opName == "fcmp") return "fcmp";
  
  // Memory operations
  if (opName == "load") return "load";
  if (opName == "store") return "store";
  if (opName == "gep") return "gep";
  if (opName == "load_indexed") return "load_indexed";
  if (opName == "store_indexed") return "store_indexed";
  
  // Type conversion
  if (opName == "cast") return "cast";
  if (opName == "sext") return "sext";
  if (opName == "zext") return "zext";
  
  // Control flow
  if (opName == "sel") return "select";
  if (opName == "phi") return "phi";
  
  // Vector operations
  if (opName == "vadd") return "vadd";
  if (opName == "vfadd") return "vfadd";
  if (opName == "vmul") return "vmul";
  if (opName == "vfmul") return "vfmul";
  if (opName == "vector.reduce.add") return "vreduce_add";
  
  // Fused operations
  if (opName == "fadd_fadd") return "fadd_fadd";
  if (opName == "fmul_fadd") return "fmul_fadd";
  if (opName == "mul_add") return "mul_add";
  
  // Data movement
  if (opName == "data_mov") return "data_mov";
  
  // Constant
  if (opName == "constant") return "const";
  
  // Default: use the original name
  return opName;
}

bool NeuraToSExpr::isBinaryOp(Operation *op) {
  llvm::StringRef opName = op->getName().stripDialect();
  return opName == "add" || opName == "sub" || opName == "mul" || opName == "div" ||
         opName == "rem" || opName == "fadd" || opName == "fsub" || opName == "fmul" ||
         opName == "fdiv" || opName == "fmax" || opName == "fmin" ||
         opName == "and" || opName == "or" || opName == "shl" ||
         opName == "icmp" || opName == "fcmp" ||
         opName == "vadd" || opName == "vfadd" || opName == "vmul" || opName == "vfmul";
}

bool NeuraToSExpr::isUnaryOp(Operation *op) {
  llvm::StringRef opName = op->getName().stripDialect();
  return opName == "fneg" || opName == "not" || opName == "sext" || opName == "zext" ||
         opName == "cast" || opName == "load" || opName == "data_mov" ||
         opName == "vector.reduce.add";
}

bool NeuraToSExpr::isTernaryOp(Operation *op) {
  llvm::StringRef opName = op->getName().stripDialect();
  return opName == "sel" || opName == "fadd_fadd" || opName == "fmul_fadd" || 
         opName == "mul_add";
}

std::string NeuraToSExpr::convertValue(Value value) {
  // Check if we already have a name for this value
  auto it = valueToVar.find(value);
  if (it != valueToVar.end()) {
    return it->second;
  }
  
  // If the value is defined by an operation in the Neura dialect, convert it
  if (Operation *defOp = value.getDefiningOp()) {
    if (defOp->getDialect() && 
        defOp->getDialect()->getNamespace() == "neura") {
      return convert(defOp);
    }
  }
  
  // Otherwise, assign a variable name (for block arguments, external values, etc.)
  return getOrCreateVar(value);
}

std::string NeuraToSExpr::convert(Operation *op) {
  // Check if we already converted this operation's result
  if (op->getNumResults() > 0) {
    auto it = valueToVar.find(op->getResult(0));
    if (it != valueToVar.end()) {
      return it->second;
    }
  }
  
  std::stringstream ss;
  llvm::StringRef opName = getOperatorName(op);
  
  // Handle constant operation specially
  if (op->getName().stripDialect() == "constant") {
    if (auto attr = op->getAttr("value")) {
      if (auto intAttr = mlir::dyn_cast<IntegerAttr>(attr)) {
        ss << intAttr.getInt();
      } else if (auto floatAttr = mlir::dyn_cast<FloatAttr>(attr)) {
        ss << floatAttr.getValueAsDouble();
      } else {
        // For other attributes, create a symbolic constant
        ss << "(const c" << varCounter++ << ")";
      }
    } else {
      ss << "(const c" << varCounter++ << ")";
    }
    
    // Cache the result
    if (op->getNumResults() > 0) {
      std::string result = ss.str();
      valueToVar[op->getResult(0)] = result;
    }
    return ss.str();
  }
  
  // Build S-expression
  ss << "(" << opName.str();
  
  // Handle different operation types
  if (isBinaryOp(op)) {
    if (op->getNumOperands() >= 1) {
      ss << " " << convertValue(op->getOperand(0));
    }
    if (op->getNumOperands() >= 2) {
      ss << " " << convertValue(op->getOperand(1));
    }
  } else if (isUnaryOp(op)) {
    if (op->getNumOperands() >= 1) {
      ss << " " << convertValue(op->getOperand(0));
    }
  } else if (isTernaryOp(op)) {
    for (unsigned i = 0; i < op->getNumOperands() && i < 3; ++i) {
      ss << " " << convertValue(op->getOperand(i));
    }
  } else {
    // Generic handling: convert all operands
    for (Value operand : op->getOperands()) {
      ss << " " << convertValue(operand);
    }
  }
  
  // Add comparison type for icmp/fcmp
  if (op->getName().stripDialect() == "icmp" || 
      op->getName().stripDialect() == "fcmp") {
    if (auto cmpTypeAttr = op->getAttrOfType<StringAttr>("cmpType")) {
      ss << " " << cmpTypeAttr.getValue().str();
    }
  }
  
  ss << ")";
  
  // Cache the result for this operation's output value
  std::string result = ss.str();
  if (op->getNumResults() > 0) {
    valueToVar[op->getResult(0)] = result;
  }
  
  return result;
}
