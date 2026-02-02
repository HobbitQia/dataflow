// RewriteRules.cpp - Generate rewrite rules for egg equality saturation
#include "EggDialect/RewriteRules.h"

#include <algorithm>
#include <unordered_set>
#include <unordered_map>
#include <sstream>
#include <regex>

namespace mlir {
namespace egg {

//===----------------------------------------------------------------------===//
// Static helper data
//===----------------------------------------------------------------------===//

// Commutative operators (integer only)
static const std::set<std::string> commutative_ops = {
  "+", "*",
  "and", "or",
  "vadd", "vmul"
};

// Associative operators (integer only)
static const std::set<std::string> associative_ops = {
  "+", "*",
  "and", "or",
  "vadd", "vmul"
};

// Operators excluded from fusion patterns
static const std::set<std::string> excluded_from_fusion = {
  "ctrl_mov",  // ctrl_mov should not be part of fusion patterns
  "reserve"    // reserve should not be part of fusion patterns
};

//===----------------------------------------------------------------------===//
// RewriteRuleGenerator implementation
//===----------------------------------------------------------------------===//

bool RewriteRuleGenerator::isCommutative(const std::string& op) {
  return commutative_ops.count(op) > 0;
}

bool RewriteRuleGenerator::isAssociative(const std::string& op) {
  return associative_ops.count(op) > 0;
}

bool RewriteRuleGenerator::isExcludedFromFusion(const std::string& op) {
  return excluded_from_fusion.count(op) > 0;
}

std::vector<RewriteRule> RewriteRuleGenerator::generateAllRules() {
  RuleGenConfig config;
  return generateRules(config);
}

std::vector<RewriteRule> RewriteRuleGenerator::generateRules(const RuleGenConfig& config) {
  std::vector<RewriteRule> rules;
  
  if (config.includeIntArith) {
    addIntArithRules(rules);
  }
  
  if (config.includeBitwise) {
    addBitwiseRules(rules);
  }
  
  // Note: Fusion rules are not generated here - they should be extracted from DFG
  // Use extractFusionRules() with the actual S-expressions from the DFG
  
  if (config.includeDataflow) {
    auto dataflow_rules = getDataflowRules();
    rules.insert(rules.end(), dataflow_rules.begin(), dataflow_rules.end());
  }
  
  deduplicateRules(rules);
  
  // Limit number of rules if configured
  if (config.maxRules > 0 && rules.size() > config.maxRules) {
    rules.erase(rules.begin() + config.maxRules, rules.end());
  }
  
  return rules;
}

std::vector<RewriteRule> RewriteRuleGenerator::generateRules(RuleCategory category) {
  switch (category) {
    case RuleCategory::AlgebraicIdentity:
      return getAlgebraicIdentityRules();
    case RuleCategory::Commutativity:
      return getCommutativityRules();
    case RuleCategory::Associativity:
      return getAssociativityRules();
    case RuleCategory::Distributivity:
      return getDistributivityRules();
    case RuleCategory::Fusion:
      // Fusion rules require DFG context - return empty
      // Use extractFusionRules() instead
      return {};
    case RuleCategory::ConstantFolding:
      return getConstantFoldingRules();
    case RuleCategory::All:
    default:
      return generateAllRules();
  }
}

//===----------------------------------------------------------------------===//
// Algebraic Identity Rules (Integer only)
//===----------------------------------------------------------------------===//

std::vector<RewriteRule> RewriteRuleGenerator::getAlgebraicIdentityRules() {
  std::vector<RewriteRule> rules;
  
  // Addition identities
  rules.push_back(makeRule("add-0-r", "(+ ?x 0)", "?x"));
  rules.push_back(makeRule("add-0-l", "(+ 0 ?x)", "?x"));
  
  // Subtraction identities
  rules.push_back(makeRule("sub-0", "(- ?x 0)", "?x"));
  rules.push_back(makeRule("sub-self", "(- ?x ?x)", "0"));
  
  // Multiplication identities
  rules.push_back(makeRule("mul-0-r", "(* ?x 0)", "0"));
  rules.push_back(makeRule("mul-0-l", "(* 0 ?x)", "0"));
  rules.push_back(makeRule("mul-1-r", "(* ?x 1)", "?x"));
  rules.push_back(makeRule("mul-1-l", "(* 1 ?x)", "?x"));
  rules.push_back(makeRule("mul-neg1", "(* ?x -1)", "(- 0 ?x)"));
  
  // Division identities
  rules.push_back(makeRule("div-1", "(/ ?x 1)", "?x"));
  rules.push_back(makeRule("div-self", "(/ ?x ?x)", "1"));  // Note: requires x != 0
  
  // Double negation
  rules.push_back(makeRule("neg-neg", "(- 0 (- 0 ?x))", "?x"));
  
  return rules;
}

//===----------------------------------------------------------------------===//
// Commutativity Rules (Integer only)
//===----------------------------------------------------------------------===//

std::vector<RewriteRule> RewriteRuleGenerator::getCommutativityRules() {
  std::vector<RewriteRule> rules;
  
  // Integer operations
  rules.push_back(makeBidirRule("commute-add", "(+ ?a ?b)", "(+ ?b ?a)"));
  rules.push_back(makeBidirRule("commute-mul", "(* ?a ?b)", "(* ?b ?a)"));
  
  // Bitwise operations
  rules.push_back(makeBidirRule("commute-and", "(and ?a ?b)", "(and ?b ?a)"));
  rules.push_back(makeBidirRule("commute-or", "(or ?a ?b)", "(or ?b ?a)"));
  
  // Vector operations
  rules.push_back(makeBidirRule("commute-vadd", "(vadd ?a ?b)", "(vadd ?b ?a)"));
  rules.push_back(makeBidirRule("commute-vmul", "(vmul ?a ?b)", "(vmul ?b ?a)"));
  
  return rules;
}

//===----------------------------------------------------------------------===//
// Associativity Rules (Integer only)
//===----------------------------------------------------------------------===//

std::vector<RewriteRule> RewriteRuleGenerator::getAssociativityRules() {
  std::vector<RewriteRule> rules;
  
  // Integer operations - reassociation
  rules.push_back(makeBidirRule("assoc-add-l", "(+ ?a (+ ?b ?c))", "(+ (+ ?a ?b) ?c)"));
  rules.push_back(makeBidirRule("assoc-mul-l", "(* ?a (* ?b ?c))", "(* (* ?a ?b) ?c)"));
  
  // Bitwise operations
  rules.push_back(makeBidirRule("assoc-and-l", "(and ?a (and ?b ?c))", "(and (and ?a ?b) ?c)"));
  rules.push_back(makeBidirRule("assoc-or-l", "(or ?a (or ?b ?c))", "(or (or ?a ?b) ?c)"));
  
  return rules;
}

//===----------------------------------------------------------------------===//
// Distributivity Rules (Integer only)
//===----------------------------------------------------------------------===//

std::vector<RewriteRule> RewriteRuleGenerator::getDistributivityRules() {
  std::vector<RewriteRule> rules;
  
  // a * (b + c) = a*b + a*c
  rules.push_back(makeBidirRule("distrib-mul-add", 
                                 "(* ?a (+ ?b ?c))", 
                                 "(+ (* ?a ?b) (* ?a ?c))"));
  // (a + b) * c = a*c + b*c
  rules.push_back(makeBidirRule("distrib-add-mul",
                                 "(* (+ ?a ?b) ?c)",
                                 "(+ (* ?a ?c) (* ?b ?c))"));
  
  return rules;
}

//===----------------------------------------------------------------------===//
// Constant Folding Rules
//===----------------------------------------------------------------------===//

std::vector<RewriteRule> RewriteRuleGenerator::getConstantFoldingRules() {
  std::vector<RewriteRule> rules;
  
  // Strength reduction
  rules.push_back(makeRule("mul-2-to-shl", "(* ?x 2)", "(shl ?x 1)"));
  rules.push_back(makeRule("mul-4-to-shl", "(* ?x 4)", "(shl ?x 2)"));
  rules.push_back(makeRule("mul-8-to-shl", "(* ?x 8)", "(shl ?x 3)"));
  
  // Division by power of 2 (unsigned)
  rules.push_back(makeRule("div-2-to-shr", "(/ ?x 2)", "(shr ?x 1)"));
  rules.push_back(makeRule("div-4-to-shr", "(/ ?x 4)", "(shr ?x 2)"));
  
  return rules;
}

//===----------------------------------------------------------------------===//
// Dataflow Operation Rules
//===----------------------------------------------------------------------===//

std::vector<RewriteRule> RewriteRuleGenerator::getDataflowRules() {
  std::vector<RewriteRule> rules;
  
  // grant_predicate simplification
  rules.push_back(makeRule("grant-pred-true",
                           "(grant_pred ?x true)",
                           "?x"));
  
  // phi_start with same init and back value
  rules.push_back(makeRule("phi-start-same",
                           "(phi_start ?x ?x)",
                           "?x"));
  
  // select simplification
  rules.push_back(makeRule("select-true",
                           "(select true ?a ?b)",
                           "?a"));
  rules.push_back(makeRule("select-false",
                           "(select false ?a ?b)",
                           "?b"));
  rules.push_back(makeRule("select-same",
                           "(select ?cond ?a ?a)",
                           "?a"));
  
  // not-not elimination
  rules.push_back(makeRule("not-not",
                           "(not (not ?x))",
                           "?x"));
  
  // icmp simplifications
  rules.push_back(makeRule("icmp-self-eq",
                           "(icmp ?x ?x eq)",
                           "true"));
  rules.push_back(makeRule("icmp-self-ne",
                           "(icmp ?x ?x ne)",
                           "false"));
  
  return rules;
}

//===----------------------------------------------------------------------===//
// Integer Arithmetic Rules
//===----------------------------------------------------------------------===//

void RewriteRuleGenerator::addIntArithRules(std::vector<RewriteRule>& rules) {
  auto identity_rules = getAlgebraicIdentityRules();
  rules.insert(rules.end(), identity_rules.begin(), identity_rules.end());

  auto commute_rules = getCommutativityRules();
  rules.insert(rules.end(), commute_rules.begin(), commute_rules.end());

  auto assoc_rules = getAssociativityRules();
  rules.insert(rules.end(), assoc_rules.begin(), assoc_rules.end());

  auto distrib_rules = getDistributivityRules();
  rules.insert(rules.end(), distrib_rules.begin(), distrib_rules.end());
}

//===----------------------------------------------------------------------===//
// Bitwise Operation Rules
//===----------------------------------------------------------------------===//

void RewriteRuleGenerator::addBitwiseRules(std::vector<RewriteRule>& rules) {
  // AND identities
  rules.push_back(makeRule("and-0", "(and ?x 0)", "0"));
  rules.push_back(makeRule("and-all1", "(and ?x -1)", "?x"));
  rules.push_back(makeRule("and-self", "(and ?x ?x)", "?x"));
  
  // OR identities
  rules.push_back(makeRule("or-0", "(or ?x 0)", "?x"));
  rules.push_back(makeRule("or-all1", "(or ?x -1)", "-1"));
  rules.push_back(makeRule("or-self", "(or ?x ?x)", "?x"));
  
  // NOT identities
  rules.push_back(makeRule("not-not", "(not (not ?x))", "?x"));
  
  // De Morgan's laws
  rules.push_back(makeBidirRule("demorgan-and", 
                                 "(not (and ?a ?b))", 
                                 "(or (not ?a) (not ?b))"));
  rules.push_back(makeBidirRule("demorgan-or",
                                 "(not (or ?a ?b))",
                                 "(and (not ?a) (not ?b))"));
}

//===----------------------------------------------------------------------===//
// Deduplication
//===----------------------------------------------------------------------===//

void RewriteRuleGenerator::deduplicateRules(std::vector<RewriteRule>& rules) {
  std::unordered_set<std::string> seen;
  std::vector<RewriteRule> unique;
  
  for (const auto& rule : rules) {
    std::string key = rule.lhs + " -> " + rule.rhs;
    if (seen.find(key) == seen.end()) {
      seen.insert(key);
      unique.push_back(rule);
    }
  }
  
  rules = std::move(unique);
}

//===----------------------------------------------------------------------===//
// DFG Pattern Extraction for Fusion Rules
//===----------------------------------------------------------------------===//

/// Helper: Parse an S-expression and return the operator name
/// e.g., "(+ a b)" -> "+"
static std::string getOperator(const std::string& sexpr) {
  if (sexpr.empty() || sexpr[0] != '(') {
    return "";
  }
  
  size_t start = 1;
  size_t end = sexpr.find_first_of(" )", start);
  if (end == std::string::npos) {
    return "";
  }
  
  return sexpr.substr(start, end - start);
}

/// Helper: Find matching parenthesis
static size_t findMatchingParen(const std::string& s, size_t openPos) {
  if (s[openPos] != '(') return std::string::npos;
  
  int depth = 1;
  for (size_t i = openPos + 1; i < s.size(); ++i) {
    if (s[i] == '(') depth++;
    else if (s[i] == ')') {
      depth--;
      if (depth == 0) return i;
    }
  }
  return std::string::npos;
}

/// Helper: Extract arguments from an S-expression
/// e.g., "(+ a (b c))" -> ["a", "(b c)"]
static std::vector<std::string> getArguments(const std::string& sexpr) {
  std::vector<std::string> args;
  
  if (sexpr.empty() || sexpr[0] != '(') {
    return args;
  }
  
  // Find the operator end
  size_t start = 1;
  size_t opEnd = sexpr.find_first_of(" )", start);
  if (opEnd == std::string::npos || sexpr[opEnd] == ')') {
    return args;  // No arguments
  }
  
  // Parse arguments
  size_t pos = opEnd + 1;
  while (pos < sexpr.size() - 1) {  // -1 to exclude final ')'
    // Skip whitespace
    while (pos < sexpr.size() && sexpr[pos] == ' ') pos++;
    if (pos >= sexpr.size() - 1) break;
    
    if (sexpr[pos] == '(') {
      // Nested expression
      size_t endParen = findMatchingParen(sexpr, pos);
      if (endParen != std::string::npos) {
        args.push_back(sexpr.substr(pos, endParen - pos + 1));
        pos = endParen + 1;
      } else {
        break;
      }
    } else if (sexpr[pos] != ')') {
      // Atom
      size_t end = sexpr.find_first_of(" )", pos);
      if (end == std::string::npos) end = sexpr.size() - 1;
      args.push_back(sexpr.substr(pos, end - pos));
      pos = end;
    } else {
      break;
    }
  }
  
  return args;
}

/// Helper: Count operators in an S-expression
static size_t countOperators(const std::string& sexpr) {
  size_t count = 0;
  for (size_t i = 0; i < sexpr.size(); ++i) {
    if (sexpr[i] == '(' && i + 1 < sexpr.size() && sexpr[i+1] != ' ') {
      count++;
    }
  }
  return count;
}

/// Helper: Extract all operators from an S-expression in DFS order
static void extractOperators(const std::string& sexpr, std::vector<std::string>& ops) {
  std::string op = getOperator(sexpr);
  if (!op.empty()) {
    ops.push_back(op);
    auto args = getArguments(sexpr);
    for (const auto& arg : args) {
      extractOperators(arg, ops);
    }
  }
}

/// Helper: Extract operators from a normalized pattern (excluding variable placeholders)
/// Only extracts operators that are actually preserved in the fusion pattern,
/// not operations that appear in variable positions (like 'reserve')
static void extractPatternOperators(const std::string& pattern, std::vector<std::string>& ops) {
  std::string op = getOperator(pattern);
  if (!op.empty() && op != "?" && op[0] != '?') {
    // This is a real operator, not a variable placeholder
    ops.push_back(op);
    auto args = getArguments(pattern);
    for (const auto& arg : args) {
      extractPatternOperators(arg, ops);
    }
  }
  // If op is empty or starts with '?', it's a variable - don't include it
}

std::string RewriteRuleGenerator::normalizePattern(const std::string& sexpr) {
  // Replace all leaf values (atoms that aren't operators) with variables
  // This creates a pattern that can match any concrete values
  
  std::string op = getOperator(sexpr);
  if (op.empty()) {
    // This is a leaf node - replace with a placeholder
    // We'll assign actual variable names later
    return "?_";
  }
  
  // Skip excluded operators
  if (isExcludedFromFusion(op)) {
    return "?_";
  }
  
  auto args = getArguments(sexpr);
  std::string result = "(" + op;
  for (const auto& arg : args) {
    result += " " + normalizePattern(arg);
  }
  result += ")";
  
  return result;
}

/// Helper: Extract non-overlapping patterns from a single S-expression.
/// Uses bottom-up traversal: if a pattern P is already matched in a subtree,
/// we don't count another instance of P at the current node (they would overlap).
/// This ensures we only count disjoint instances of the same pattern.
static void extractNonOverlappingSubPatterns(
    const std::string& sexpr,
    std::map<std::string, DFGPattern>& patterns,
    std::set<std::string>& patternsMatchedInSubtree) {
  
  std::string op = getOperator(sexpr);
  if (op.empty() || RewriteRuleGenerator::isExcludedFromFusion(op)) {
    return;
  }
  
  // First, recursively process children and collect patterns matched in subtrees
  auto args = getArguments(sexpr);
  std::set<std::string> allChildPatterns;
  for (const auto& arg : args) {
    std::set<std::string> childPatterns;
    extractNonOverlappingSubPatterns(arg, patterns, childPatterns);
    allChildPatterns.insert(childPatterns.begin(), childPatterns.end());
  }
  
  // Check if current node forms a pattern
  size_t opCount = countOperators(sexpr);
  if (opCount >= 2) {
    std::string normalized = RewriteRuleGenerator::normalizePattern(sexpr);
    
    // Only count this pattern if it wasn't already counted in a child subtree
    // (i.e., no overlapping instance of the same pattern exists below)
    if (allChildPatterns.find(normalized) == allChildPatterns.end()) {
      auto& patternInfo = patterns[normalized];
      if (patternInfo.frequency == 0) {
        patternInfo.pattern = normalized;
        patternInfo.opCount = opCount;
        // Extract operators from the normalized pattern
        extractPatternOperators(normalized, patternInfo.operators);
      }
      patternInfo.frequency++;
      // Mark this pattern as matched at this level
      patternsMatchedInSubtree.insert(normalized);
    }
  }
  
  // Propagate child patterns to parent (so parent knows what's already matched below)
  patternsMatchedInSubtree.insert(allChildPatterns.begin(), allChildPatterns.end());
}

void RewriteRuleGenerator::extractSubPatterns(
    const std::string& sexpr,
    std::map<std::string, DFGPattern>& patterns) {
  // This function is now a wrapper that calls the non-overlapping version
  std::set<std::string> matched;
  extractNonOverlappingSubPatterns(sexpr, patterns, matched);
}

std::vector<DFGPattern> RewriteRuleGenerator::extractPatterns(
    const std::vector<std::string>& sexprs,
    size_t minFrequency) {
  
  std::map<std::string, DFGPattern> pattern_map;
  
  // Extract non-overlapping patterns from all S-expressions
  for (const auto& sexpr : sexprs) {
    std::set<std::string> matched;
    extractNonOverlappingSubPatterns(sexpr, pattern_map, matched);
  }
  
  // Filter by frequency and collect results
  std::vector<DFGPattern> result;
  for (auto& [key, pattern] : pattern_map) {
    if (pattern.frequency >= minFrequency) {
      result.push_back(std::move(pattern));
    }
  }
  
  // Sort by frequency (descending) then by opCount (descending)
  std::sort(result.begin(), result.end(), [](const DFGPattern& a, const DFGPattern& b) {
    if (a.frequency != b.frequency) return a.frequency > b.frequency;
    return a.opCount > b.opCount;
  });
  
  return result;
}

std::string RewriteRuleGenerator::generateFusedOpName(const DFGPattern& pattern) {
  // Generate a name like "add_mul" or "load_gep_add"
  std::string name = "fused";
  for (const auto& op : pattern.operators) {
    // Sanitize operator name
    std::string sanitized = op;
    if (sanitized == "+") sanitized = "add";
    else if (sanitized == "-") sanitized = "sub";
    else if (sanitized == "*") sanitized = "mul";
    else if (sanitized == "/") sanitized = "div";
    
    name += "_" + sanitized;
  }
  return name;
}

std::vector<RewriteRule> RewriteRuleGenerator::generateFusionRulesFromPatterns(
    const std::vector<DFGPattern>& patterns) {
  
  std::vector<RewriteRule> rules;
  int var_counter = 0;
  
  for (const auto& pattern : patterns) {
    // Create a new pattern with proper variable names
    std::string lhs = pattern.pattern;
    
    var_counter = 0;
    std::string new_pattern;
    for (size_t i = 0; i < lhs.size(); ++i) {
      if (i + 1 < lhs.size() && lhs[i] == '?' && lhs[i+1] == '_') {
        char var_name = 'a' + (var_counter % 26);
        new_pattern += "?";
        new_pattern += var_name;
        var_counter++;
        i++;
      } else {
        new_pattern += lhs[i];
      }
    }
    lhs = new_pattern;

    std::string fused_op_name = generateFusedOpName(pattern);
    if (fused_op_name.substr(0, 6) == "fused_") {
      fused_op_name = fused_op_name.substr(6);
    }

    std::string rhs = "(fused " + fused_op_name;
    for (int i = 0; i < var_counter; ++i) {
      char var_name = 'a' + (i % 26);
      rhs += " ?";
      rhs += var_name;
    }
    rhs += ")";

    std::string rule_name = "fuse-" + fused_op_name;
    rules.push_back(makeRule(rule_name, lhs, rhs));

    std::string unfuse_rule_name = "unfuse-" + fused_op_name;
    rules.push_back(makeRule(unfuse_rule_name, rhs, lhs));
  }
  
  return rules;
}

std::vector<RewriteRule> RewriteRuleGenerator::extractFusionRules(
    const std::vector<std::string>& sexprs,
    size_t minFrequency) {
  
  auto patterns = extractPatterns(sexprs, minFrequency);
  return generateFusionRulesFromPatterns(patterns);
}

} // namespace egg
} // namespace mlir
