// RewriteRules.cpp - Generate rewrite rules for egg equality saturation
#include "EggDialect/RewriteRules.h"

#include <algorithm>
#include <unordered_set>
#include <unordered_map>
#include <sstream>
#include <regex>
#include "llvm/Support/raw_ostream.h"

namespace mlir {
namespace egg {

// Commutative operators (integer only).
static const std::set<std::string> commutative_ops = {
  "add", "mul",
  "and", "or"
};

// Associative operators (integer only).
static const std::set<std::string> associative_ops = {
  "add", "mul",
  "and", "or"
};

// Operators excluded from fusion patterns.
static const std::set<std::string> excluded_from_fusion = {
  "ctrl_mov",
  "reserve",
  "data_mov",
  "yield",
  "alloca"
};

// Returns true if the operator is commutative.
bool RewriteRuleGenerator::isCommutative(const std::string& op) {
  return commutative_ops.count(op) > 0;
}

// Returns true if the operator is associative.
bool RewriteRuleGenerator::isAssociative(const std::string& op) {
  return associative_ops.count(op) > 0;
}

// Returns true if the operator should be excluded from fusion patterns.
bool RewriteRuleGenerator::isExcludedFromFusion(const std::string& op) {
  return excluded_from_fusion.count(op) > 0;
}

// Returns all rewrite rules with default configuration.
std::vector<RewriteRule> RewriteRuleGenerator::generateAllRules() {
  RuleGenConfig config;
  return generateRules(config);
}

// Returns rewrite rules with custom configuration.
std::vector<RewriteRule> RewriteRuleGenerator::generateRules(const RuleGenConfig& config) {
  std::vector<RewriteRule> rules;
  
  if (config.includeIntArith) {
    addIntArithRules(rules);
  }
  
  if (config.includeBitwise) {
    addBitwiseRules(rules);
  }
  
  if (config.includeDataflow) {
    auto dataflow_rules = getDataflowRules();
    rules.insert(rules.end(), dataflow_rules.begin(), dataflow_rules.end());
  }
  
  deduplicateRules(rules);
  
  if (config.maxRules > 0 && rules.size() > config.maxRules) {
    rules.erase(rules.begin() + config.maxRules, rules.end());
  }
  
  return rules;
}

// Returns rules for a specific category.
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

// Returns algebraic identity rules for integer operations.
std::vector<RewriteRule> RewriteRuleGenerator::getAlgebraicIdentityRules() {
  std::vector<RewriteRule> rules;
  rules.push_back(makeRule("add-0-r", "(add ?x 0)", "?x"));
  rules.push_back(makeRule("add-0-l", "(add 0 ?x)", "?x"));
  rules.push_back(makeRule("sub-0", "(sub ?x 0)", "?x"));
  rules.push_back(makeRule("sub-self", "(sub ?x ?x)", "0"));
  rules.push_back(makeRule("mul-0-r", "(mul ?x 0)", "0"));
  rules.push_back(makeRule("mul-0-l", "(mul 0 ?x)", "0"));
  rules.push_back(makeRule("mul-1-r", "(mul ?x 1)", "?x"));
  rules.push_back(makeRule("mul-1-l", "(mul 1 ?x)", "?x"));
  rules.push_back(makeRule("mul-neg1", "(mul ?x -1)", "(sub 0 ?x)"));
  rules.push_back(makeRule("div-1", "(div ?x 1)", "?x"));
  rules.push_back(makeRule("div-self", "(div ?x ?x)", "1"));
  rules.push_back(makeRule("neg-neg", "(sub 0 (sub 0 ?x))", "?x"));
  
  return rules;
}

// Returns commutativity rules for commutative operators.
std::vector<RewriteRule> RewriteRuleGenerator::getCommutativityRules() {
  std::vector<RewriteRule> rules;
  rules.push_back(makeBidirRule("commute-add", "(add ?a ?b)", "(add ?b ?a)"));
  rules.push_back(makeBidirRule("commute-mul", "(mul ?a ?b)", "(mul ?b ?a)"));
  rules.push_back(makeBidirRule("commute-and", "(and ?a ?b)", "(and ?b ?a)"));
  rules.push_back(makeBidirRule("commute-or", "(or ?a ?b)", "(or ?b ?a)"));
  
  return rules;
}

// Returns associativity rules.
std::vector<RewriteRule> RewriteRuleGenerator::getAssociativityRules() {
  std::vector<RewriteRule> rules;
  rules.push_back(makeBidirRule("assoc-add-l", "(add ?a (add ?b ?c))", "(add (add ?a ?b) ?c)"));
  rules.push_back(makeBidirRule("assoc-mul-l", "(mul ?a (mul ?b ?c))", "(mul (mul ?a ?b) ?c)"));
  rules.push_back(makeBidirRule("assoc-and-l", "(and ?a (and ?b ?c))", "(and (and ?a ?b) ?c)"));
  rules.push_back(makeBidirRule("assoc-or-l", "(or ?a (or ?b ?c))", "(or (or ?a ?b) ?c)"));
  
  return rules;
}

// Returns distributivity rules.
std::vector<RewriteRule> RewriteRuleGenerator::getDistributivityRules() {
  std::vector<RewriteRule> rules;
  rules.push_back(makeBidirRule("distrib-mul-add", 
                                 "(mul ?a (add ?b ?c))", 
                                 "(add (mul ?a ?b) (mul ?a ?c))"));
  rules.push_back(makeBidirRule("distrib-add-mul",
                                 "(mul (add ?a ?b) ?c)",
                                 "(add (mul ?a ?c) (mul ?b ?c))"));
  
  return rules;
}

// Returns constant folding rules for strength reduction.
std::vector<RewriteRule> RewriteRuleGenerator::getConstantFoldingRules() {
  std::vector<RewriteRule> rules;
  rules.push_back(makeRule("mul-2-to-shl", "(mul ?x 2)", "(shl ?x 1)"));
  rules.push_back(makeRule("mul-4-to-shl", "(mul ?x 4)", "(shl ?x 2)"));
  rules.push_back(makeRule("mul-8-to-shl", "(mul ?x 8)", "(shl ?x 3)"));
  rules.push_back(makeRule("div-2-to-shr", "(div ?x 2)", "(shr ?x 1)"));
  rules.push_back(makeRule("div-4-to-shr", "(div ?x 4)", "(shr ?x 2)"));
  
  return rules;
}

// Returns dataflow operation rules.
std::vector<RewriteRule> RewriteRuleGenerator::getDataflowRules() {
  std::vector<RewriteRule> rules;
  rules.push_back(makeRule("grant-pred-true",
                           "(grant_pred ?x true)",
                           "?x"));
  rules.push_back(makeRule("phi-start-same",
                           "(phi_start ?x ?x)",
                           "?x"));
  rules.push_back(makeRule("select-true",
                           "(select true ?a ?b)",
                           "?a"));
  rules.push_back(makeRule("select-false",
                           "(select false ?a ?b)",
                           "?b"));
  rules.push_back(makeRule("select-same",
                           "(select ?cond ?a ?a)",
                           "?a"));
  rules.push_back(makeRule("not-not",
                           "(not (not ?x))",
                           "?x"));
  rules.push_back(makeRule("icmp-self-eq",
                           "(icmp ?x ?x eq)",
                           "true"));
  rules.push_back(makeRule("icmp-self-ne",
                           "(icmp ?x ?x ne)",
                           "false"));
  
  return rules;
}

// Appends integer arithmetic rules to the rules vector.
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

// Appends bitwise operation rules to the rules vector.
void RewriteRuleGenerator::addBitwiseRules(std::vector<RewriteRule>& rules) {
  rules.push_back(makeRule("and-0", "(and ?x 0)", "0"));
  rules.push_back(makeRule("and-all1", "(and ?x -1)", "?x"));
  rules.push_back(makeRule("and-self", "(and ?x ?x)", "?x"));
  rules.push_back(makeRule("or-0", "(or ?x 0)", "?x"));
  rules.push_back(makeRule("or-all1", "(or ?x -1)", "-1"));
  rules.push_back(makeRule("or-self", "(or ?x ?x)", "?x"));
  rules.push_back(makeRule("not-not", "(not (not ?x))", "?x"));
  rules.push_back(makeBidirRule("demorgan-and", 
                                 "(not (and ?a ?b))", 
                                 "(or (not ?a) (not ?b))"));
  rules.push_back(makeBidirRule("demorgan-or",
                                 "(not (or ?a ?b))",
                                 "(and (not ?a) (not ?b))"));
}

// Removes duplicate rules from the given rules vector.
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

// Returns the operator name from an S-expression.
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

// Returns the index of the matching closing parenthesis.
static size_t findMatchingParen(const std::string& s, size_t openPos) {
  if (s[openPos] != '(') {
    return std::string::npos;
  }
  
  int depth = 1;
  for (size_t i = openPos + 1; i < s.size(); ++i) {
    if (s[i] == '(') {
      depth++;
    } else if (s[i] == ')') {
      depth--;
      if (depth == 0) {
        return i;
      }
    }
  }
  return std::string::npos;
}

// Returns arguments extracted from an S-expression.
static std::vector<std::string> getArguments(const std::string& sexpr) {
  std::vector<std::string> args;
  
  if (sexpr.empty() || sexpr[0] != '(') {
    return args;
  }
  
  size_t start = 1;
  size_t opEnd = sexpr.find_first_of(" )", start);
  if (opEnd == std::string::npos || sexpr[opEnd] == ')') {
    return args;
  }
  
  size_t pos = opEnd + 1;
  while (pos < sexpr.size() - 1) {
    while (pos < sexpr.size() && sexpr[pos] == ' ') {
      pos++;
    }
    if (pos >= sexpr.size() - 1) {
      break;
    }
    
    if (sexpr[pos] == '(') {
      size_t endParen = findMatchingParen(sexpr, pos);
      if (endParen != std::string::npos) {
        args.push_back(sexpr.substr(pos, endParen - pos + 1));
        pos = endParen + 1;
      } else {
        break;
      }
    } else if (sexpr[pos] != ')') {
      size_t end = sexpr.find_first_of(" )", pos);
      if (end == std::string::npos) {
        end = sexpr.size() - 1;
      }
      args.push_back(sexpr.substr(pos, end - pos));
      pos = end;
    } else {
      break;
    }
  }
  
  return args;
}

// Operators that should be ignored when counting operators.
static const std::set<std::string> ignored_for_counting = {
  "reserve", "ctrl_mov", "yield", "alloca"
};

// Returns true if the operator should be ignored for counting and area calculation.
static bool isIgnoredOperator(const std::string& op) {
  return ignored_for_counting.count(op) > 0;
}

// Returns the count of operators in an S-expression (excludes ignored operators).
static size_t countOperators(const std::string& sexpr) {
  std::string op = getOperator(sexpr);
  if (op.empty() || isIgnoredOperator(op)) {
    return 0;
  }
  
  size_t count = 1;
  auto args = getArguments(sexpr);
  for (const auto& arg : args) {
    count += countOperators(arg);
  }
  return count;
}

// Returns the total area of operators in an S-expression based on the area map.
// Ignores operators in the ignored_for_counting set.
static size_t calculateArea(const std::string& sexpr, const AreaMap& area_map) {
  size_t area = 0;
  std::string op = getOperator(sexpr);
  if (!op.empty()) {
    // Skips ignored operators but still processes their arguments.
    if (!isIgnoredOperator(op)) {
      auto it = area_map.find(op);
      if (it != area_map.end()) {
        area += it->second;
      } else {
        llvm::errs() << "Warning: Operator '" << op << "' not found in area map, using 0.\n";
      }
    }
    auto args = getArguments(sexpr);
    for (const auto& arg : args) {
      area += calculateArea(arg, area_map);
    }
  }
  return area;
}

// Appends operators from a normalized pattern to the ops vector (excludes variable placeholders).
static void extractPatternOperators(const std::string& pattern, std::vector<std::string>& ops) {
  std::string op = getOperator(pattern);
  if (!op.empty() && op != "?" && op[0] != '?') {
    ops.push_back(op);
    auto args = getArguments(pattern);
    for (const auto& arg : args) {
      extractPatternOperators(arg, ops);
    }
  } 
}

// Returns a normalized pattern with concrete values replaced by variable placeholders.
std::string RewriteRuleGenerator::normalizePattern(const std::string& sexpr) {
  std::string op = getOperator(sexpr);
  if (op.empty()) {
    return "?_";
  }
  
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

// Populates non-overlapping patterns from a single S-expression using bottom-up traversal.
static void extractNonOverlappingSubPatterns(const std::string& sexpr, std::map<std::string, DFGPattern>& patterns, std::set<std::string>& patterns_matched_in_subtree, const AreaMap& area_map) {
  std::string op = getOperator(sexpr);
  if (op.empty() || RewriteRuleGenerator::isExcludedFromFusion(op)) {
    return;
  }
  
  auto args = getArguments(sexpr);
  std::set<std::string> all_child_patterns;
  for (const auto& arg : args) {
    std::set<std::string> child_patterns;
    extractNonOverlappingSubPatterns(arg, patterns, child_patterns, area_map);
    all_child_patterns.insert(child_patterns.begin(), child_patterns.end());
  }
  
  size_t op_count = countOperators(sexpr);
  size_t area = calculateArea(sexpr, area_map);
  if (op_count >= 2) {
    std::string normalized = RewriteRuleGenerator::normalizePattern(sexpr);
    
    if (all_child_patterns.find(normalized) == all_child_patterns.end()) {
      auto& pattern_info = patterns[normalized];
      if (pattern_info.frequency == 0) {
        pattern_info.pattern = normalized;
        pattern_info.op_count = op_count;
        pattern_info.area = area;
        extractPatternOperators(normalized, pattern_info.operators);
      }
      pattern_info.frequency++;
      patterns_matched_in_subtree.insert(normalized);
    }
  }
  
  patterns_matched_in_subtree.insert(all_child_patterns.begin(), all_child_patterns.end());
}

// Returns patterns extracted from a list of S-expressions with area calculation.
std::vector<DFGPattern> RewriteRuleGenerator::extractPatterns(const std::vector<std::string>& sexprs, const AreaMap& area_map, size_t min_pattern_frequency, size_t max_pattern_area, size_t max_pattern_ops) {
  std::map<std::string, DFGPattern> pattern_map;
  
  for (const auto& sexpr : sexprs) {
    std::set<std::string> matched;
    extractNonOverlappingSubPatterns(sexpr, pattern_map, matched, area_map);
  }
  
  std::vector<DFGPattern> result;
  for (auto& [key, pattern] : pattern_map) {
    if (pattern.frequency >= min_pattern_frequency && 
        pattern.area <= max_pattern_area &&
        pattern.op_count <= max_pattern_ops) {
      result.push_back(std::move(pattern));
    }
  }
  
  llvm::errs() << "Extracted " << result.size() << " fusion patterns (min_freq=" << min_pattern_frequency 
               << ", max_area=" << max_pattern_area 
               << ", max_ops=" << max_pattern_ops << ")\n";
  
  std::sort(result.begin(), result.end(), [](const DFGPattern& a, const DFGPattern& b) {
    if (a.frequency != b.frequency) {
      return a.frequency > b.frequency;
    }
    return a.op_count > b.op_count;
  });
  
  return result;
}

// Returns a fused operation name generated from a pattern.
std::string RewriteRuleGenerator::generateFusedOpName(const DFGPattern& pattern) {
  std::string name;
  for (size_t i = 0; i < pattern.operators.size(); ++i) {
    if (i > 0) name += "_";
    name += pattern.operators[i];
  }
  return name;
}

// Returns fusion rules generated from extracted patterns.
std::vector<RewriteRule> RewriteRuleGenerator::generateFusionRulesFromPatterns(const std::vector<DFGPattern>& patterns) {
  std::vector<RewriteRule> rules;
  int var_counter = 0;
  
  for (const auto& pattern : patterns) {
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

    std::string rhs = "(fused " + fused_op_name;
    for (int i = 0; i < var_counter; ++i) {
      char var_name = 'a' + (i % 26);
      rhs += " ?";
      rhs += var_name;
    }
    rhs += ")";

    std::string rule_name = "fuse_" + fused_op_name;
    rules.push_back(makeRule(rule_name, lhs, rhs));
  }
  
  return rules;
}

} // namespace egg
} // namespace mlir
