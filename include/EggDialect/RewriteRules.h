// RewriteRules.h - Generates rewrite rules for egg equality saturation.
#ifndef EGG_REWRITE_RULES_H
#define EGG_REWRITE_RULES_H

#include "EggDialect/EggSaturation.h"

#include <string>
#include <vector>
#include <set>
#include <map>

namespace mlir {
namespace egg {

// Category of rewrite rules.
enum class RuleCategory {
  AlgebraicIdentity,
  Commutativity,
  Associativity,
  Distributivity,
  Fusion,
  ConstantFolding,
  All
};

// Configuration for rule generation.
struct RuleGenConfig {
  bool includeIntArith = true;
  bool includeBitwise = true;
  bool includeComparison = true;
  bool includeFusion = true;
  bool includeDataflow = true;
  size_t maxRules = 1000;
  size_t minPatternFrequency = 2;
};

// Represents a pattern extracted from DFG for potential fusion.
struct DFGPattern {
  std::string pattern;
  size_t frequency = 0;
  size_t op_count = 0;
  std::vector<std::string> operators;
  size_t area = 0;
  
  bool operator<(const DFGPattern& other) const {
    return pattern < other.pattern;
  }
};

// Generates rewrite rules for Neura dialect that can be used by egg
// for equality saturation based optimization.
class RewriteRuleGenerator {
public:
  // Generates all rewrite rules with default configuration.
  static std::vector<RewriteRule> generateAllRules();
  
  // Generates rewrite rules with custom configuration.
  static std::vector<RewriteRule> generateRules(const RuleGenConfig& config);
  
  // Generates rules for a specific category.
  static std::vector<RewriteRule> generateRules(RuleCategory category);
  
  // Returns algebraic identity rules.
  static std::vector<RewriteRule> getAlgebraicIdentityRules();
  
  // Returns commutativity rules for commutative operators.
  static std::vector<RewriteRule> getCommutativityRules();
  
  // Returns associativity rules.
  static std::vector<RewriteRule> getAssociativityRules();
  
  // Returns distributivity rules.
  static std::vector<RewriteRule> getDistributivityRules();

  // Returns constant folding rules.
  static std::vector<RewriteRule> getConstantFoldingRules();
  
  // Returns dataflow operation rules.
  static std::vector<RewriteRule> getDataflowRules();
  
  // Checks if an operator is commutative.
  static bool isCommutative(const std::string& op);
  
  // Checks if an operator is associative.
  static bool isAssociative(const std::string& op);
  
  // Checks if an operator should be excluded from fusion patterns.
  static bool isExcludedFromFusion(const std::string& op);
  
  // Normalizes a pattern by replacing concrete values with variables.
  static std::string normalizePattern(const std::string& sexpr);
  
  // Extracts patterns from a list of S-expressions with area calculation.
  static std::vector<DFGPattern> extractPatterns(const std::vector<std::string>& sexprs, const AreaMap& area_map, size_t min_frequency = 2, size_t max_area = 100, size_t max_ops = 20);
  
  // Generates fusion rules from extracted patterns.
  static std::vector<RewriteRule> generateFusionRulesFromPatterns(const std::vector<DFGPattern>& patterns);

private:
  // Adds integer arithmetic rules to the rules vector.
  static void addIntArithRules(std::vector<RewriteRule>& rules);
  
  // Adds bitwise operation rules to the rules vector.
  static void addBitwiseRules(std::vector<RewriteRule>& rules);
  
  // Removes duplicate rules from the rules vector.
  static void deduplicateRules(std::vector<RewriteRule>& rules);
  
  // Generates a fused operator name from a pattern.
  static std::string generateFusedOpName(const DFGPattern& pattern);
};

// Creates a simple rewrite rule.
inline RewriteRule makeRule(const std::string& name, const std::string& lhs, const std::string& rhs, bool bidir = false) {
  return RewriteRule(name, lhs, rhs, bidir);
}

// Creates a bidirectional rewrite rule.
inline RewriteRule makeBidirRule(const std::string& name, const std::string& lhs, const std::string& rhs) {
  return RewriteRule(name, lhs, rhs, true);
}

} // namespace egg
} // namespace mlir

#endif // EGG_REWRITE_RULES_H
