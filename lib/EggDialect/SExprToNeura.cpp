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
    
    std::string pattern_name;
    if (args[0]->isAtom()) {
      pattern_name = args[0]->atom;
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
    
    return createFusedOp(pattern_name, operands, node);
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
  std::string clean_name = varName;
  if (!clean_name.empty() && clean_name[0] == '?') {
    clean_name = clean_name.substr(1);
  }

  if (varToValue.count(clean_name)) {
    return varToValue[clean_name];
  }
  
  llvm::errs() << "Warning: Unknown variable: " << varName << "\n";
  return Value();
}

Value SExprToNeura::parseConstant(const std::string& str) {
  // Remove quotes if present
  std::string clean_str = str;
  if (clean_str.size() >= 2 && clean_str.front() == '"' && clean_str.back() == '"') {
    clean_str = clean_str.substr(1, clean_str.size() - 2);
  }

  bool is_integer = true;
  size_t start_idx = 0;
  if (!clean_str.empty() && (clean_str[0] == '-' || clean_str[0] == '+')) {
    start_idx = 1;
  }
  for (size_t i = start_idx; i < clean_str.size() && is_integer; ++i) {
    if (!std::isdigit(clean_str[i])) {
      is_integer = false;
    }
  }

  if (is_integer && !clean_str.empty() && start_idx < clean_str.size()) {
    // Parse as integer using strtoll which doesn't throw
    char* endPtr;
    int64_t int_val = std::strtoll(clean_str.c_str(), &endPtr, 10);

    if (*endPtr == '\0') {
      auto int_type = builder.getI64Type();
      auto pred_type = builder.getI1Type();
      auto result_type = neura::PredicatedValue::get(builder.getContext(), int_type, pred_type);

      auto const_op = builder.create<neura::ConstantOp>(
          loc, result_type, builder.getI64IntegerAttr(int_val));
      return const_op.getResult();
    }
  }
  
  // Not an integer, might be a variable name
  llvm::errs() << "Note: Could not parse constant: " << str << "\n";
  return Value();
}

Value SExprToNeura::createNeuraOp(const std::string& op, ArrayRef<Value> operands) {
  Type result_type;
  if (!operands.empty() && operands[0]) {
    result_type = operands[0].getType();
  } else {
    auto i64_type = builder.getI64Type();
    result_type = neura::PredicatedValue::get(builder.getContext(), i64_type, builder.getI1Type());
  }
  if (op == "add") {
    if (operands.size() >= 2) {
      return builder.create<neura::AddOp>(loc, result_type, operands[0], operands[1]).getResult();
    }
  } else if (op == "sub") {
    if (operands.size() >= 2) {
      return builder.create<neura::SubOp>(loc, result_type, operands[0], operands[1]).getResult();
    }
  } else if (op == "mul") {
    if (operands.size() >= 2) {
      return builder.create<neura::MulOp>(loc, result_type, operands[0], operands[1]).getResult();
    }
  } else if (op == "div") {
    if (operands.size() >= 2) {
      return builder.create<neura::DivOp>(loc, result_type, operands[0], operands[1]).getResult();
    }
  } else if (op == "phi_start") {
    if (operands.size() >= 2) {
      return builder.create<neura::PhiStartOp>(loc, result_type, operands[0], operands[1]).getResult();
    }
  } else if (op == "grant_once") {
    if (operands.size() >= 1) {
      return builder.create<neura::GrantOnceOp>(loc, result_type, operands[0]).getResult();
    }
  } else if (op == "grant_pred") {
    if (operands.size() >= 2) {
      return builder.create<neura::GrantPredicateOp>(loc, result_type, operands[0], operands[1]).getResult();
    }
  } else if (op == "reserve") {
    return builder.create<neura::ReserveOp>(loc, result_type).getResult();
  } else if (op == "load") {
    if (operands.size() >= 1) {
      return builder.create<neura::LoadOp>(loc, result_type, operands[0]).getResult();
    }
  } else if (op == "store") {
    if (operands.size() >= 2) {
      builder.create<neura::StoreOp>(loc, operands[0], operands[1]);
      return operands[0];  // Store doesn't have a result
    }
  } else if (op == "gep") {
    if (operands.size() >= 2) {
      SmallVector<Value> indices(operands.begin() + 1, operands.end());
      return builder.create<neura::GEP>(loc, result_type, operands[0], indices).getResult();
    }
  } else if (op == "icmp") {
    auto i1_type = builder.getI1Type();
    auto cmp_result_type = neura::PredicatedValue::get(builder.getContext(), i1_type, i1_type);
    if (operands.size() >= 2) {
      return builder.create<neura::ICmpOp>(loc, cmp_result_type, operands[0], operands[1],
                                            builder.getStringAttr("slt")).getResult();
    }
  } else if (op == "not") {
    if (operands.size() >= 1) {
      return builder.create<neura::NotOp>(loc, result_type, operands[0]).getOutput();
    }
  } else if (op == "sel" || op == "select") {
    if (operands.size() >= 3) {
      return builder.create<neura::SelOp>(loc, result_type, operands[0], operands[1], operands[2]).getResult();
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
  Type result_type;
  if (!operands.empty() && operands[0]) {
    result_type = operands[0].getType();
  } else {
    auto i64_type = builder.getI64Type();
    result_type = neura::PredicatedValue::get(builder.getContext(), i64_type, builder.getI1Type());
  }

  int64_t pattern_id = patternIdCounter++;
  int64_t frequency = 1;
  std::string pattern_name = fusedOpName;

  if (fusedPatterns.count(fusedOpName)) {
    const auto& info = fusedPatterns[fusedOpName];
    pattern_name = info.patternName;
    frequency = info.frequency;
  }

  auto fused_op = builder.create<neura::FusedOp>(
      loc,
      TypeRange{result_type},
      operands,
      builder.getI64IntegerAttr(pattern_id),
      builder.getStringAttr(pattern_name),
      builder.getI64IntegerAttr(frequency));
  
  // Create the body region with the pattern
  // The body will contain a block argument for each input
  Block* body = builder.createBlock(&fused_op.getBody());
  
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
  
  return fused_op.getResult(0);
}

} // namespace egg
} // namespace mlir
