// SExprToNeura.h - Convert S-expression back to Neura dialect IR
#ifndef EGG_SEXPR_TO_NEURA_H
#define EGG_SEXPR_TO_NEURA_H

#include "mlir/IR/Builders.h"
#include "mlir/IR/Operation.h"
#include "mlir/IR/Value.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/StringRef.h"

#include <string>
#include <vector>
#include <memory>

namespace mlir {
namespace egg {

/// Parsed S-expression node
struct SExprNode {
  enum Kind { Atom, List };
  Kind kind;
  std::string atom;  // For atoms (operators, variables, constants)
  std::vector<std::unique_ptr<SExprNode>> children;  // For lists
  
  SExprNode(Kind k) : kind(k) {}
  
  bool isAtom() const { return kind == Atom; }
  bool isList() const { return kind == List; }
  
  // Get the operator name (first element of a list)
  std::string getOperator() const {
    if (isList() && !children.empty() && children[0]->isAtom()) {
      return children[0]->atom;
    }
    return "";
  }
  
  // Get arguments (all elements after the first in a list)
  std::vector<SExprNode*> getArgs() const {
    std::vector<SExprNode*> args;
    if (isList()) {
      for (size_t i = 1; i < children.size(); ++i) {
        args.push_back(children[i].get());
      }
    }
    return args;
  }
};

/// Pattern information for fused operations
struct FusedPatternInfo {
  std::string patternName;  // The fused operator name (e.g., "fused_add_mul")
  std::string originalPattern;  // The original S-expression pattern
  size_t frequency;  // How many times this pattern appears
  std::vector<std::string> operators;  // Operators involved
};

/// Converts S-expression back to Neura dialect operations.
///
/// When a fused operator is encountered (e.g., "fused_add_mul"), 
/// it creates a neura.fused_op with the pattern_name attribute.
class SExprToNeura {
public:
  SExprToNeura(OpBuilder& builder, Location loc) 
    : builder(builder), loc(loc), pattern_id_counter(0) {}
  
  /// Set the variable to value mapping (from NeuraToSExpr)
  void setVarMap(const llvm::StringMap<Value>& map) {
    var_to_value = map;
  }
  
  /// Register a fused pattern for recognition
  void registerFusedPattern(const std::string& fusedOpName, 
                            const FusedPatternInfo& info) {
    fused_patterns[fusedOpName] = info;
  }
  
  /// Parse an S-expression string into a tree
  static std::unique_ptr<SExprNode> parse(const std::string& sexpr);
  
  /// Convert a parsed S-expression back to MLIR Value
  /// Returns the result value of the reconstructed operations
  Value convert(SExprNode* node);
  
  /// Convert an S-expression string directly
  Value convert(const std::string& sexpr);
  
  /// Check if an operator is "fused" (the new format uses (fused pattern_name ...))
  bool isFusedOp(const std::string& op) const {
    return op == "fused";
  }
  
  /// Check if a pattern name is a known fused pattern
  bool isKnownFusedPattern(const std::string& patternName) const {
    return fused_patterns.count(patternName) > 0;
  }

private:
  /// Create a neura operation from the operator name and operands
  Value createNeuraOp(const std::string& op, ArrayRef<Value> operands);
  
  /// Create a fused_op for a fused pattern
  Value createFusedOp(const std::string& fusedOpName, 
                      ArrayRef<Value> operands,
                      SExprNode* originalNode);
  
  /// Get a value from a variable name
  Value getValueFromVar(const std::string& varName);
  
  /// Parse a constant value from a string
  Value parseConstant(const std::string& str);
  
  OpBuilder& builder;
  Location loc;
  
  /// Mapping from variable names to MLIR values
  llvm::StringMap<Value> var_to_value;
  
  /// Registered fused patterns
  llvm::StringMap<FusedPatternInfo> fused_patterns;
  
  /// Counter for generating unique pattern IDs
  int64_t pattern_id_counter;
  
  /// Cache for already converted nodes to avoid duplicates
  llvm::StringMap<Value> converted_cache;
};

} // namespace egg
} // namespace mlir

#endif // EGG_SEXPR_TO_NEURA_H
