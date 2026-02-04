// RewriteRules.cpp - Generate rewrite rules for egg equality saturation
#include "EggDialect/RewriteRules.h"

#include <algorithm>
#include <unordered_set>
#include <unordered_map>
#include <sstream>
#include <regex>
#include <queue>
#include "mlir/IR/Operation.h"
#include "mlir/IR/Dialect.h"
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
      }
    }
    auto args = getArguments(sexpr);
    for (const auto& arg : args) {
      area += calculateArea(arg, area_map);
    }
  }
  return area;
}

// Returns the critical path latency (longest path) in an S-expression.
// For a tree structure like (add (mul a b) c), calculates:
//   max(latency(mul) + calculateCriticalPathLatency(a), 
//       latency(mul) + calculateCriticalPathLatency(b),
//       latency(add) + calculateCriticalPathLatency(c))
// where child paths are independent and the longest determines the critical path.
static size_t calculateCriticalPathLatency(const std::string& sexpr, const LatencyMap& latency_map) {
  std::string op = getOperator(sexpr);
  if (op.empty()) {
    return 0;  // Variable placeholder or leaf node.
  }
  
  // Gets the latency of the current operator.
  size_t current_latency = 0;
  if (!isIgnoredOperator(op)) {
    auto it = latency_map.find(op);
    if (it != latency_map.end()) {
      current_latency = it->second;
    }
  }
  
  // Calculates the maximum latency among all child paths.
  size_t max_child_latency = 0;
  auto args = getArguments(sexpr);
  for (const auto& arg : args) {
    size_t child_latency = calculateCriticalPathLatency(arg, latency_map);
    max_child_latency = std::max(max_child_latency, child_latency);
  }
  
  return current_latency + max_child_latency;
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

// Populates non-overlapping patterns from a single S-expression using bottom-up traversal.
// Uses PPASpec to calculate both area and critical path latency.
static void extractNonOverlappingSubPatternsWithPPA(
    const std::string& sexpr, 
    std::map<std::string, DFGPattern>& patterns, 
    std::set<std::string>& patterns_matched_in_subtree, 
    const PPASpec& ppa_spec) {
  std::string op = getOperator(sexpr);
  if (op.empty() || RewriteRuleGenerator::isExcludedFromFusion(op)) {
    return;
  }
  
  auto args = getArguments(sexpr);
  std::set<std::string> all_child_patterns;
  for (const auto& arg : args) {
    std::set<std::string> child_patterns;
    extractNonOverlappingSubPatternsWithPPA(arg, patterns, child_patterns, ppa_spec);
    all_child_patterns.insert(child_patterns.begin(), child_patterns.end());
  }
  
  size_t op_count = countOperators(sexpr);
  size_t area = calculateArea(sexpr, ppa_spec.area_map);
  size_t critical_latency = calculateCriticalPathLatency(sexpr, ppa_spec.latency_map);
  
  if (op_count >= 2) {
    std::string normalized = RewriteRuleGenerator::normalizePattern(sexpr);
    
    if (all_child_patterns.find(normalized) == all_child_patterns.end()) {
      auto& pattern_info = patterns[normalized];
      if (pattern_info.frequency == 0) {
        pattern_info.pattern = normalized;
        pattern_info.op_count = op_count;
        pattern_info.area = area;
        pattern_info.critical_path_latency = critical_latency;
        extractPatternOperators(normalized, pattern_info.operators);
      }
      pattern_info.frequency++;
      patterns_matched_in_subtree.insert(normalized);
    }
  }
  
  patterns_matched_in_subtree.insert(all_child_patterns.begin(), all_child_patterns.end());
}

// Collects all subexpressions from a single S-expression.
static void collectAllSubexpressions(const std::string& sexpr, std::set<std::string>& all_subexprs) {
  std::string op = getOperator(sexpr);
  if (op.empty() || RewriteRuleGenerator::isExcludedFromFusion(op)) {
    return;
  }
  
  // Adds current expression if it has at least 2 operators.
  size_t op_count = countOperators(sexpr);
  if (op_count >= 2) {
    all_subexprs.insert(sexpr);
  }
  
  // Recursively collects from children.
  auto args = getArguments(sexpr);
  for (const auto& arg : args) {
    collectAllSubexpressions(arg, all_subexprs);
  }
}

// Returns patterns extracted from a list of S-expressions with PPA constraints.
std::vector<DFGPattern> RewriteRuleGenerator::extractPatterns(
    const std::vector<std::string>& sexprs, 
    const PPASpec& ppa_spec, 
    size_t min_pattern_frequency, 
    size_t max_pattern_area, 
    size_t max_pattern_ops,
    size_t max_critical_path_latency) {
  
  // Step 1: Collects all unique subexpressions from all input expressions.
  std::set<std::string> all_subexprs;
  for (const auto& sexpr : sexprs) {
    collectAllSubexpressions(sexpr, all_subexprs);
  }
  
  // Step 2: Counts pattern frequency by normalizing each unique subexpression.
  // Each unique subexpression is counted only once, avoiding duplicate counting
  // when the same subexpression appears in multiple input expressions.
  std::map<std::string, DFGPattern> pattern_map;
  for (const auto& subexpr : all_subexprs) {
    std::string normalized = normalizePattern(subexpr);
    size_t op_count = countOperators(subexpr);
    size_t area = calculateArea(subexpr, ppa_spec.area_map);
    size_t critical_latency = calculateCriticalPathLatency(subexpr, ppa_spec.latency_map);
    
    auto& pattern_info = pattern_map[normalized];
    if (pattern_info.frequency == 0) {
      pattern_info.pattern = normalized;
      pattern_info.op_count = op_count;
      pattern_info.area = area;
      pattern_info.critical_path_latency = critical_latency;
      extractPatternOperators(normalized, pattern_info.operators);
    }
    pattern_info.frequency++;
  }
  
  // Step 3: Filters patterns by constraints.
  std::set<std::string> seen_patterns;
  std::vector<DFGPattern> result;
  for (auto& [key, pattern] : pattern_map) {
    if (seen_patterns.count(pattern.pattern) > 0) {
      continue;
    }
    
    if (pattern.frequency >= min_pattern_frequency && 
        pattern.area <= max_pattern_area &&
        pattern.op_count <= max_pattern_ops &&
        pattern.critical_path_latency <= max_critical_path_latency) {
      seen_patterns.insert(pattern.pattern);
      result.push_back(std::move(pattern));
    }
  }
  
  llvm::errs() << "=== Pattern Extraction Results ===\n";
  llvm::errs() << "Extracted " << result.size() << " fusion patterns with constraints:\n";
  llvm::errs() << "  - min_frequency: " << min_pattern_frequency << "\n";
  llvm::errs() << "  - max_area: " << max_pattern_area << "\n";
  llvm::errs() << "  - max_ops: " << max_pattern_ops << "\n";
  llvm::errs() << "  - max_critical_path_latency: " << max_critical_path_latency << " ps\n";
  
  std::sort(result.begin(), result.end(), [](const DFGPattern& a, const DFGPattern& b) {
    if (a.frequency != b.frequency) {
      return a.frequency > b.frequency;
    }
    return a.op_count > b.op_count;
  });
  
  // Outputs extracted patterns.
  llvm::errs() << "\nExtracted patterns:\n";
  for (size_t i = 0; i < result.size(); ++i) {
    const auto& p = result[i];
    llvm::errs() << "  [" << i << "] freq=" << p.frequency 
                 << ", ops=" << p.op_count 
                 << ", area=" << p.area 
                 << ", latency=" << p.critical_path_latency << "ps"
                 << "\n      pattern: " << p.pattern << "\n";
  }
  llvm::errs() << "==================================\n";
  
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
  std::set<std::string> seen_rule_names;  // Tracks unique rule names.
  int var_counter = 0;
  int unique_suffix = 0;
  
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

    // Generates unique rule name by appending a suffix if needed.
    std::string rule_name = "fuse_" + fused_op_name;
    if (seen_rule_names.count(rule_name) > 0) {
      rule_name = rule_name + "_" + std::to_string(++unique_suffix);
    }
    seen_rule_names.insert(rule_name);
    
    rules.push_back(makeRule(rule_name, lhs, rhs));
  }
  
  // Outputs generated rewrite rules.
  llvm::errs() << "\n=== Generated Rewrite Rules ===\n";
  llvm::errs() << "Total rules: " << rules.size() << "\n";
  for (size_t i = 0; i < rules.size(); ++i) {
    const auto& r = rules[i];
    llvm::errs() << "  [" << i << "] " << r.name << ": " << r.lhs 
                 << " => " << r.rhs << "\n";
  }
  llvm::errs() << "================================\n\n";
  
  return rules;
}

// --- DFG-based Pattern Extraction ---
// The following functions extract patterns directly from MLIR Operations (DFG)
// instead of from S-expressions. This avoids duplicate counting caused by
// DAG-to-tree conversion where shared nodes appear multiple times.

// Returns the normalized operator name for an operation (same as NeuraToSExpr).
static std::string getOpName(mlir::Operation* op) {
  llvm::StringRef name = op->getName().stripDialect();
  if (name == "constant") return "const";
  if (name == "grant_predicate") return "grant_pred";
  return name.str();
}

// Returns true if the operation is excluded from fusion patterns.
static bool isOpExcludedFromFusion(mlir::Operation* op) {
  std::string name = getOpName(op);
  return RewriteRuleGenerator::isExcludedFromFusion(name);
}

// Builds a normalized pattern string from a DFG rooted at the given operation.
// Visits each operation in the DFG exactly once using depth-limited BFS.
// Returns the normalized pattern and collects all visited operations.
static std::string buildNormalizedPatternFromOp(
    mlir::Operation* root,
    std::set<mlir::Operation*>& visited_ops,
    size_t max_depth = 20) {
  
  std::string root_name = getOpName(root);
  if (isOpExcludedFromFusion(root)) {
    return "?_";
  }
  
  visited_ops.insert(root);
  
  // Build pattern recursively from operands.
  std::string pattern = "(" + root_name;
  for (Value operand : root->getOperands()) {
    if (mlir::Operation* def_op = operand.getDefiningOp()) {
      if (def_op->getDialect() && 
          def_op->getDialect()->getNamespace() == "neura" &&
          max_depth > 0) {
        pattern += " " + buildNormalizedPatternFromOp(def_op, visited_ops, max_depth - 1);
      } else {
        pattern += " ?_";
      }
    } else {
      pattern += " ?_";
    }
  }
  
  // Add comparison type for icmp/fcmp (consistent with NeuraToSExpr.cpp).
  llvm::StringRef op_stripped = root->getName().stripDialect();
  if (op_stripped == "icmp" || op_stripped == "fcmp") {
    if (auto cmp_type_attr = root->getAttrOfType<mlir::StringAttr>("cmpType")) {
      pattern += " " + cmp_type_attr.getValue().str();
    }
  }
  
  pattern += ")";
  
  return pattern;
}

// Extracts patterns directly from DFG (MLIR Operations) with PPA constraints.
// This function counts each operation instance exactly once, avoiding the
// duplicate counting that occurs when DAG is converted to expression tree.
std::vector<DFGPattern> RewriteRuleGenerator::extractPatternsFromDFG(
    const std::vector<mlir::Operation*>& ops,
    const PPASpec& ppa_spec,
    size_t min_frequency,
    size_t max_area,
    size_t max_ops,
    size_t max_critical_path_latency) {
  
  // Step 1: Build a map from each operation to its ID for deduplication.
  std::map<mlir::Operation*, size_t> op_to_id;
  for (size_t i = 0; i < ops.size(); ++i) {
    op_to_id[ops[i]] = i;
  }
  
  // Step 2: For each operation, generate normalized patterns for subgraphs rooted at it.
  // Key: (normalized_pattern, frozenset of operation IDs) -> ensures each unique subgraph is counted once.
  std::map<std::string, std::set<std::set<size_t>>> pattern_instances;
  
  for (mlir::Operation* root_op : ops) {
    if (isOpExcludedFromFusion(root_op)) continue;
    
    // Generate patterns with different depths starting from root_op.
    for (size_t depth = 1; depth <= max_ops; ++depth) {
      std::set<mlir::Operation*> visited_ops;
      std::string pattern = buildNormalizedPatternFromOp(root_op, visited_ops, depth);
      
      // Count operators in this pattern.
      size_t op_count = 0;
      for (char c : pattern) {
        if (c == '(') ++op_count;
      }
      
      if (op_count < 2) continue;  // Skip patterns with less than 2 operators.
      if (op_count > max_ops) continue;
      
      // Convert visited operations to a set of IDs.
      std::set<size_t> op_ids;
      for (mlir::Operation* op : visited_ops) {
        auto it = op_to_id.find(op);
        if (it != op_to_id.end()) {
          op_ids.insert(it->second);
        }
      }
      
      // Add this instance to the pattern's instance set.
      // Each unique set of operation IDs is counted as one instance.
      pattern_instances[pattern].insert(op_ids);
    }
  }
  
  // Step 3: Convert to DFGPattern with PPA constraints.
  std::map<std::string, DFGPattern> pattern_map;
  for (const auto& [pattern, instances] : pattern_instances) {
    size_t frequency = instances.size();
    
    // Calculate area and latency from the pattern string.
    size_t area = calculateArea(pattern, ppa_spec.area_map);
    size_t critical_latency = calculateCriticalPathLatency(pattern, ppa_spec.latency_map);
    size_t op_count = 0;
    for (char c : pattern) {
      if (c == '(') ++op_count;
    }
    
    DFGPattern dfg_pattern;
    dfg_pattern.pattern = pattern;
    dfg_pattern.frequency = frequency;
    dfg_pattern.op_count = op_count;
    dfg_pattern.area = area;
    dfg_pattern.critical_path_latency = critical_latency;
    extractPatternOperators(pattern, dfg_pattern.operators);
    
    pattern_map[pattern] = dfg_pattern;
  }
  
  // Step 4: Filter by constraints and remove duplicates.
  std::set<std::string> seen_patterns;
  std::vector<DFGPattern> result;
  for (auto& [key, pattern] : pattern_map) {
    if (seen_patterns.count(pattern.pattern) > 0) {
      continue;
    }
    
    if (pattern.frequency >= min_frequency && 
        pattern.area <= max_area &&
        pattern.op_count <= max_ops &&
        pattern.critical_path_latency <= max_critical_path_latency) {
      seen_patterns.insert(pattern.pattern);
      result.push_back(std::move(pattern));
    }
  }
  
  // Step 5: Sort by frequency (descending), then by op_count (descending).
  std::sort(result.begin(), result.end(), [](const DFGPattern& a, const DFGPattern& b) {
    if (a.frequency != b.frequency) {
      return a.frequency > b.frequency;
    }
    return a.op_count > b.op_count;
  });
  
  // Output results.
  llvm::errs() << "=== DFG Pattern Extraction Results ===\n";
  llvm::errs() << "Extracted " << result.size() << " fusion patterns from DFG with constraints:\n";
  llvm::errs() << "  - min_frequency: " << min_frequency << "\n";
  llvm::errs() << "  - max_area: " << max_area << "\n";
  llvm::errs() << "  - max_ops: " << max_ops << "\n";
  llvm::errs() << "  - max_critical_path_latency: " << max_critical_path_latency << " ps\n";
  
  llvm::errs() << "\nExtracted patterns:\n";
  for (size_t i = 0; i < result.size(); ++i) {
    const auto& p = result[i];
    llvm::errs() << "  [" << i << "] freq=" << p.frequency 
                 << ", ops=" << p.op_count 
                 << ", area=" << p.area 
                 << ", latency=" << p.critical_path_latency << "ps"
                 << "\n      pattern: " << p.pattern << "\n";
  }
  llvm::errs() << "======================================\n";
  
  return result;
}

} // namespace egg
} // namespace mlir
