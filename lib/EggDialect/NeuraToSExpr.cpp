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
  
  std::string var_name = "v" + std::to_string(varCounter++);
  valueToVar[value] = var_name;
  varToValue[var_name] = value;
  return var_name;
}

llvm::StringRef NeuraToSExpr::getOperatorName(Operation *op) {
  llvm::StringRef op_name = op->getName().stripDialect();
  
  // Map Neura operations to S-expression operators
  // Arithmetic operations
  if (op_name == "constant") return "const";
  // Control flow operations - use abbreviated names for egg compatibility
  if (op_name == "grant_predicate") return "grant_pred";
  return op_name;
}

bool NeuraToSExpr::isBinaryOp(Operation *op) {
  llvm::StringRef op_name = op->getName().stripDialect();
  return op_name == "add" || op_name == "sub" || op_name == "mul" || op_name == "div" ||
         op_name == "rem" || op_name == "fadd" || op_name == "fsub" || op_name == "fmul" ||
         op_name == "fdiv" || op_name == "fmax" || op_name == "fmin" ||
         op_name == "and" || op_name == "or" || op_name == "shl" ||
         op_name == "icmp" || op_name == "fcmp" ||
         op_name == "gep" || op_name == "phi_start" || op_name == "grant_predicate" ||
         op_name == "grant_pred" || op_name == "ctrl_mov" || op_name == "store";
}

bool NeuraToSExpr::isUnaryOp(Operation *op) {
  llvm::StringRef op_name = op->getName().stripDialect();
  return op_name == "fneg" || op_name == "not" || op_name == "sext" || op_name == "zext" ||
         op_name == "cast" || op_name == "load" || op_name == "data_mov" ||
         op_name == "return_value";
}

bool NeuraToSExpr::isTernaryOp(Operation *op) {
  llvm::StringRef op_name = op->getName().stripDialect();
  return op_name == "sel" || op_name == "fadd_fadd" || op_name == "fmul_fadd" ||
         op_name == "mul_add";
}

std::string NeuraToSExpr::convertValue(Value value) {
  // Check if we already have a name for this value
  auto it = valueToVar.find(value);
  if (it != valueToVar.end()) {
    return it->second;
  }
  
  // If the value is defined by an operation in the Neura dialect, convert it
  if (Operation *def_op = value.getDefiningOp()) {
    if (def_op->getDialect() && 
        def_op->getDialect()->getNamespace() == "neura") {
      return convert(def_op);
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
  llvm::StringRef op_name = getOperatorName(op);
  
  // Handle constant operation specially
  if (op->getName().stripDialect() == "constant") {
    if (auto attr = op->getAttr("value")) {
      if (auto int_attr = mlir::dyn_cast<IntegerAttr>(attr)) {
        ss << int_attr.getInt();
      } else if (auto float_attr = mlir::dyn_cast<FloatAttr>(attr)) {
        ss << float_attr.getValueAsDouble();
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
  
  // Handle grant_once operation (constant with predicate)
  if (op->getName().stripDialect() == "grant_once") {
    ss << "(grant_once";
    if (auto const_val = op->getAttr("constant_value")) {
      if (auto int_attr = mlir::dyn_cast<IntegerAttr>(const_val)) {
        ss << " " << int_attr.getInt();
      } else if (auto str_attr = mlir::dyn_cast<StringAttr>(const_val)) {
        ss << " " << str_attr.getValue().str();
      } else {
        ss << " c" << varCounter++;
      }
    }
    ss << ")";
    
    if (op->getNumResults() > 0) {
      std::string result = ss.str();
      valueToVar[op->getResult(0)] = result;
    }
    return ss.str();
  }
  
  // Handle reserve operation (no operands)
  if (op->getName().stripDialect() == "reserve") {
    ss << "(reserve r" << varCounter++ << ")";
    if (op->getNumResults() > 0) {
      std::string result = ss.str();
      valueToVar[op->getResult(0)] = result;
    }
    return ss.str();
  }
  
  // Handle yield operation (no result, terminator)
  if (op->getName().stripDialect() == "yield") {
    return "(yield)";
  }
  
  ss << "(" << op_name.str();
  
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
    if (auto cmp_type_attr = op->getAttrOfType<StringAttr>("cmpType")) {
      ss << " " << cmp_type_attr.getValue().str();
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
