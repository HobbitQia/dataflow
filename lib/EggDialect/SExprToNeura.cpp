// SExprToNeura.cpp - Convert S-expression back to Neura dialect IR
#include "EggDialect/SExprToNeura.h"
#include "NeuraDialect/NeuraDialect.h"
#include "NeuraDialect/NeuraOps.h"
#include "NeuraDialect/NeuraTypes.h"

#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "llvm/Support/raw_ostream.h"

#include <cctype>
#include <sstream>

namespace mlir {
namespace egg {

//===----------------------------------------------------------------------===//
// S-expression Parser
//===----------------------------------------------------------------------===//

namespace {

class SExprParser {
public:
  SExprParser(const std::string& input) : input(input), pos(0) {}
  
  std::unique_ptr<SExprNode> parse() {
    skipWhitespace();
    if (pos >= input.size()) return nullptr;
    
    if (input[pos] == '(') {
      return parseList();
    } else {
      return parseAtom();
    }
  }

private:
  void skipWhitespace() {
    while (pos < input.size() && std::isspace(input[pos])) {
      pos++;
    }
  }
  
  std::unique_ptr<SExprNode> parseList() {
    if (input[pos] != '(') return nullptr;
    pos++;  // skip '('
    
    auto node = std::make_unique<SExprNode>(SExprNode::List);
    
    while (pos < input.size()) {
      skipWhitespace();
      if (pos >= input.size()) break;
      
      if (input[pos] == ')') {
        pos++;  // skip ')'
        break;
      }
      
      auto child = parse();
      if (child) {
        node->children.push_back(std::move(child));
      }
    }
    
    return node;
  }
  
  std::unique_ptr<SExprNode> parseAtom() {
    skipWhitespace();
    if (pos >= input.size()) return nullptr;
    
    std::string atom;
    while (pos < input.size() && !std::isspace(input[pos]) && 
           input[pos] != '(' && input[pos] != ')') {
      atom += input[pos++];
    }
    
    if (atom.empty()) return nullptr;
    
    auto node = std::make_unique<SExprNode>(SExprNode::Atom);
    node->atom = atom;
    return node;
  }
  
  const std::string& input;
  size_t pos;
};

}  // anonymous namespace

std::unique_ptr<SExprNode> SExprToNeura::parse(const std::string& sexpr) {
  SExprParser parser(sexpr);
  return parser.parse();
}

//===----------------------------------------------------------------------===//
// S-expression to Neura IR Converter
//===----------------------------------------------------------------------===//

Value SExprToNeura::convert(const std::string& sexpr) {
  auto node = parse(sexpr);
  if (!node) {
    llvm::errs() << "Failed to parse S-expression: " << sexpr << "\n";
    return Value();
  }
  return convert(node.get());
}

Value SExprToNeura::convert(SExprNode* node) {
  if (!node) return Value();
  
  // Handle atoms (variables, constants)
  if (node->isAtom()) {
    const std::string& atom = node->atom;
    
    // Check if it's a variable
    if (atom[0] == '?' || atom[0] == 'v' || atom[0] == 'r' || 
        atom.find("%arg") == 0 || varToValue.count(atom)) {
      return getValueFromVar(atom);
    }
    
    // Check cache
    if (convertedCache.count(atom)) {
      return convertedCache[atom];
    }
    
    // Try to parse as constant
    return parseConstant(atom);
  }
  
  // Handle lists (operations)
  std::string op = node->getOperator();
  if (op.empty()) {
    llvm::errs() << "Empty operator in S-expression\n";
    return Value();
  }
  
  // Check if this is the 'fused' operator: (fused pattern_name ?a ?b ...)
  if (isFusedOp(op)) {
    // New format: (fused pattern_name ?a ?b ...)
    // First argument is the pattern name, rest are the operands
    auto args = node->getArgs();
    if (args.empty()) {
      llvm::errs() << "Fused operator missing pattern name\n";
      return Value();
    }
    
    // Get pattern name (first argument)
    std::string patternName;
    if (args[0]->isAtom()) {
      patternName = args[0]->atom;
    } else {
      llvm::errs() << "Fused pattern name must be an atom\n";
      return Value();
    }
    
    // Convert remaining arguments (skip the pattern name)
    SmallVector<Value, 4> operands;
    for (size_t i = 1; i < args.size(); ++i) {
      Value v = convert(args[i]);
      if (v) {
        operands.push_back(v);
      }
    }
    
    return createFusedOp(patternName, operands, node);
  }
  
  // Regular operation: recursively convert arguments
  auto args = node->getArgs();
  SmallVector<Value, 4> operands;
  for (auto* arg : args) {
    Value v = convert(arg);
    if (v) {
      operands.push_back(v);
    }
  }
  
  // Create regular neura operation
  return createNeuraOp(op, operands);
}

Value SExprToNeura::getValueFromVar(const std::string& varName) {
  // First check the direct mapping
  if (varToValue.count(varName)) {
    return varToValue[varName];
  }
  
  // Try without leading characters like '?'
  std::string cleanName = varName;
  if (!cleanName.empty() && cleanName[0] == '?') {
    cleanName = cleanName.substr(1);
  }
  
  if (varToValue.count(cleanName)) {
    return varToValue[cleanName];
  }
  
  llvm::errs() << "Warning: Unknown variable: " << varName << "\n";
  return Value();
}

Value SExprToNeura::parseConstant(const std::string& str) {
  // Remove quotes if present
  std::string cleanStr = str;
  if (cleanStr.size() >= 2 && cleanStr.front() == '"' && cleanStr.back() == '"') {
    cleanStr = cleanStr.substr(1, cleanStr.size() - 2);
  }
  
  // Check if it's a valid integer
  bool isInteger = true;
  size_t startIdx = 0;
  if (!cleanStr.empty() && (cleanStr[0] == '-' || cleanStr[0] == '+')) {
    startIdx = 1;
  }
  for (size_t i = startIdx; i < cleanStr.size() && isInteger; ++i) {
    if (!std::isdigit(cleanStr[i])) {
      isInteger = false;
    }
  }
  
  if (isInteger && !cleanStr.empty() && startIdx < cleanStr.size()) {
    // Parse as integer using strtoll which doesn't throw
    char* endPtr;
    int64_t intVal = std::strtoll(cleanStr.c_str(), &endPtr, 10);
    
    if (*endPtr == '\0') {  // Successfully parsed entire string
      auto intType = builder.getI64Type();
      auto predType = builder.getI1Type();
      auto resultType = neura::PredicatedValue::get(builder.getContext(), intType, predType);
      
      // Create a constant op
      auto constOp = builder.create<neura::ConstantOp>(
          loc, resultType, builder.getI64IntegerAttr(intVal));
      return constOp.getResult();
    }
  }
  
  // Not an integer, might be a variable name
  llvm::errs() << "Note: Could not parse constant: " << str << "\n";
  return Value();
}

Value SExprToNeura::createNeuraOp(const std::string& op, ArrayRef<Value> operands) {
  // Determine result type - use first operand's type if available, otherwise default
  Type resultType;
  if (!operands.empty() && operands[0]) {
    resultType = operands[0].getType();
  } else {
    auto i64Type = builder.getI64Type();
    resultType = neura::PredicatedValue::get(builder.getContext(), i64Type, builder.getI1Type());
  }
  
  // Create the appropriate neura operation based on operator name
  if (op == "+" || op == "add") {
    if (operands.size() >= 2) {
      return builder.create<neura::AddOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "-" || op == "sub") {
    if (operands.size() >= 2) {
      return builder.create<neura::SubOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "*" || op == "mul") {
    if (operands.size() >= 2) {
      return builder.create<neura::MulOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "/" || op == "div") {
    if (operands.size() >= 2) {
      return builder.create<neura::DivOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "phi_start") {
    if (operands.size() >= 2) {
      return builder.create<neura::PhiStartOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "grant_once") {
    if (operands.size() >= 1) {
      return builder.create<neura::GrantOnceOp>(loc, resultType, operands[0]).getResult();
    }
  } else if (op == "grant_pred") {
    if (operands.size() >= 2) {
      return builder.create<neura::GrantPredicateOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "reserve") {
    return builder.create<neura::ReserveOp>(loc, resultType).getResult();
  } else if (op == "load") {
    if (operands.size() >= 1) {
      return builder.create<neura::LoadOp>(loc, resultType, operands[0]).getResult();
    }
  } else if (op == "store") {
    if (operands.size() >= 2) {
      builder.create<neura::StoreOp>(loc, operands[0], operands[1]);
      return operands[0];  // Store doesn't have a result
    }
  } else if (op == "gep") {
    if (operands.size() >= 2) {
      SmallVector<Value> indices(operands.begin() + 1, operands.end());
      return builder.create<neura::GEP>(loc, resultType, operands[0], indices).getResult();
    }
  } else if (op == "icmp") {
    // icmp has comparison operands and a cmpType attribute
    auto i1Type = builder.getI1Type();
    auto cmpResultType = neura::PredicatedValue::get(builder.getContext(), i1Type, i1Type);
    if (operands.size() >= 2) {
      // Use "slt" (signed less than) as default comparison type
      return builder.create<neura::ICmpOp>(loc, cmpResultType, operands[0], operands[1], 
                                            builder.getStringAttr("slt")).getResult();
    }
  } else if (op == "not") {
    if (operands.size() >= 1) {
      return builder.create<neura::NotOp>(loc, resultType, operands[0]).getOutput();
    }
  } else if (op == "sel" || op == "select") {
    if (operands.size() >= 3) {
      return builder.create<neura::SelOp>(loc, resultType, operands[0], operands[1], operands[2]).getResult();
    }
  } else if (op == "vadd") {
    if (operands.size() >= 2) {
      return builder.create<neura::VAddOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  } else if (op == "vmul") {
    if (operands.size() >= 2) {
      return builder.create<neura::VMulOp>(loc, resultType, operands[0], operands[1]).getResult();
    }
  }
  
  // Fallback: log the operation we couldn't handle
  llvm::errs() << "Note: Unhandled operator '" << op << "' with " 
               << operands.size() << " operands\n";
  return Value();
}

Value SExprToNeura::createFusedOp(const std::string& fusedOpName, 
                                  ArrayRef<Value> operands,
                                  SExprNode* originalNode) {
  // Get result type from first operand
  Type resultType;
  if (!operands.empty() && operands[0]) {
    resultType = operands[0].getType();
  } else {
    auto i64Type = builder.getI64Type();
    resultType = neura::PredicatedValue::get(builder.getContext(), i64Type, builder.getI1Type());
  }
  
  // Get pattern info if available
  int64_t patternId = patternIdCounter++;
  int64_t frequency = 1;
  std::string patternName = fusedOpName;
  
  if (fusedPatterns.count(fusedOpName)) {
    const auto& info = fusedPatterns[fusedOpName];
    patternName = info.patternName;
    frequency = info.frequency;
  }
  
  // Create the fused_op
  auto fusedOp = builder.create<neura::FusedOp>(
      loc,
      TypeRange{resultType},
      operands,
      builder.getI64IntegerAttr(patternId),
      builder.getStringAttr(patternName),
      builder.getI64IntegerAttr(frequency));
  
  // Create the body region with the pattern
  // The body will contain a block argument for each input
  Block* body = builder.createBlock(&fusedOp.getBody());
  
  // Add block arguments for each input
  for (auto operand : operands) {
    body->addArgument(operand.getType(), loc);
  }
  
  // For now, just yield the first argument as placeholder
  // In a full implementation, we would reconstruct the original pattern here
  OpBuilder::InsertionGuard guard(builder);
  builder.setInsertionPointToEnd(body);
  
  if (!body->getArguments().empty()) {
    builder.create<neura::YieldOp>(loc, body->getArguments().front());
  } else {
    builder.create<neura::YieldOp>(loc);
  }
  
  return fusedOp.getResult(0);
}

} // namespace egg
} // namespace mlir
