// NeuraToSExpr.h - Convert Neura dialect IR to S-expression for egg
#ifndef EGG_NEURA_TO_SEXPR_H
#define EGG_NEURA_TO_SEXPR_H

#include "mlir/IR/Operation.h"
#include "mlir/IR/Value.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/StringRef.h"

#include <string>
#include <sstream>

namespace mlir {
namespace egg {

/// Converts Neura dialect operations to S-expression format for egg.
/// 
/// The S-expression format uses prefix notation:
///   - Binary ops: (op lhs rhs)
///   - Unary ops: (op operand)
///   - Constants: value or (const value)
///   - Variables: v0, v1, v2, ...
///
/// Example:
///   %0 = neura.add %a, %b
///   %1 = neura.mul %0, %c
/// Becomes:
///   (mul (add v0 v1) v2)
class NeuraToSExpr {
public:
  NeuraToSExpr() : varCounter(0) {}
  
  /// Convert an operation and its operand tree to S-expression.
  /// Returns the S-expression string representation.
  std::string convert(Operation *op);
  
  /// Convert a value to S-expression.
  /// If the value is defined by an operation, recursively converts it.
  /// If the value is a block argument or external, assigns a variable name.
  std::string convertValue(Value value);
  
  /// Get the mapping from variable names to MLIR values.
  const llvm::DenseMap<Value, std::string>& getValueMap() const {
    return valueToVar;
  }
  
  /// Get the reverse mapping from variable names to MLIR values.
  const llvm::StringMap<Value>& getVarMap() const {
    return varToValue;
  }
  
  /// Clear all state for reuse.
  void reset() {
    valueToVar.clear();
    varToValue.clear();
    varCounter = 0;
  }

private:
  /// Get or create a variable name for a value.
  std::string getOrCreateVar(Value value);
  
  /// Convert a Neura operation to its S-expression operator name.
  static llvm::StringRef getOperatorName(Operation *op);
  
  /// Check if an operation is a binary operation.
  static bool isBinaryOp(Operation *op);
  
  /// Check if an operation is a unary operation.
  static bool isUnaryOp(Operation *op);
  
  /// Check if an operation is a ternary operation.
  static bool isTernaryOp(Operation *op);
  
  /// Map from MLIR values to variable names.
  llvm::DenseMap<Value, std::string> valueToVar;
  
  /// Reverse map from variable names to MLIR values.
  llvm::StringMap<Value> varToValue;
  
  /// Counter for generating unique variable names.
  unsigned varCounter;
};

} // namespace egg
} // namespace mlir

#endif // EGG_NEURA_TO_SEXPR_H
