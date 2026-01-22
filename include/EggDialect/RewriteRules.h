// RewriteRules.h - Generate rewrite rules for egg equality saturation
#ifndef EGG_REWRITE_RULES_H
#define EGG_REWRITE_RULES_H

#include "EggDialect/EggSaturation.h"

#include <string>
#include <vector>
#include <set>
#include <map>

namespace mlir {
namespace egg {

/// Category of rewrite rules
enum class RuleCategory {
  /// Algebraic identities (x + 0 = x, x * 1 = x, etc.)
  AlgebraicIdentity,
  /// Commutativity rules (a + b = b + a)
  Commutativity,
  /// Associativity rules (a + (b + c) = (a + b) + c)
  Associativity,
  /// Distributivity rules (a * (b + c) = a*b + a*c)
  Distributivity,
  /// Operation fusion (patterns extracted from DFG)
  Fusion,
  /// Constant folding hints
  ConstantFolding,
  /// All categories
  All
};

/// Configuration for rule generation
struct RuleGenConfig {
  /// Include integer arithmetic rules
  bool includeIntArith = true;
  /// Include bitwise operation rules
  bool includeBitwise = true;
  /// Include comparison operation rules
  bool includeComparison = true;
  /// Include fused operation rules
  bool includeFusion = true;
  /// Include dataflow operation rules (phi_start, grant_predicate, etc.)
  bool includeDataflow = true;
  /// Maximum number of rules to generate
  size_t maxRules = 1000;
  /// Minimum frequency for a pattern to become a fusion rule
  size_t minPatternFrequency = 2;
};

/// A pattern extracted from DFG for potential fusion
struct DFGPattern {
  /// The S-expression pattern (with variables like ?a, ?b, etc.)
  std::string pattern;
  /// Number of times this pattern appears in the DFG
  size_t frequency = 0;
  /// Number of operations in this pattern
  size_t opCount = 0;
  /// The operators involved (in order)
  std::vector<std::string> operators;
  
  bool operator<(const DFGPattern& other) const {
    return pattern < other.pattern;
  }
};

/// Rewrite rule generator for Neura dialect
///
/// This class generates rewrite rules that can be used by egg for
/// equality saturation based optimization. Fusion rules are extracted
/// dynamically from the DFG by finding patterns that appear multiple times.
class RewriteRuleGenerator {
public:
  /// Generate all rewrite rules with default configuration
  static std::vector<RewriteRule> generateAllRules();
  
  /// Generate rewrite rules with custom configuration
  static std::vector<RewriteRule> generateRules(const RuleGenConfig& config);
  
  /// Generate rules for a specific category
  static std::vector<RewriteRule> generateRules(RuleCategory category);
  
  /// Get algebraic identity rules (x + 0 = x, x * 1 = x, etc.)
  static std::vector<RewriteRule> getAlgebraicIdentityRules();
  
  /// Get commutativity rules for commutative operators
  static std::vector<RewriteRule> getCommutativityRules();
  
  /// Get associativity rules
  static std::vector<RewriteRule> getAssociativityRules();
  
  /// Get distributivity rules
  static std::vector<RewriteRule> getDistributivityRules();

  /// Get constant folding rules
  static std::vector<RewriteRule> getConstantFoldingRules();
  
  /// Get dataflow operation rules
  static std::vector<RewriteRule> getDataflowRules();
  
  /// Check if an operator is commutative
  static bool isCommutative(const std::string& op);
  
  /// Check if an operator is associative
  static bool isAssociative(const std::string& op);
  
  /// Check if an operator should be excluded from fusion patterns
  static bool isExcludedFromFusion(const std::string& op);
  
  /// Normalize a pattern by replacing concrete values with variables
  /// @param sexpr The S-expression to normalize
  /// @return Normalized pattern with variables
  static std::string normalizePattern(const std::string& sexpr);
  
  //===--------------------------------------------------------------------===//
  // DFG Pattern Extraction for Fusion Rules
  //===--------------------------------------------------------------------===//
  
  /// Extract patterns from a list of S-expressions
  /// @param sexprs List of S-expressions from the DFG
  /// @param minFrequency Minimum frequency for a pattern to be included
  /// @return List of patterns that appear at least minFrequency times
  static std::vector<DFGPattern> extractPatterns(
      const std::vector<std::string>& sexprs,
      size_t minFrequency = 2);
  
  /// Generate fusion rules from extracted patterns
  /// @param patterns Patterns extracted from DFG
  /// @return Fusion rules for the patterns
  static std::vector<RewriteRule> generateFusionRulesFromPatterns(
      const std::vector<DFGPattern>& patterns);
  
  /// Combined: extract patterns and generate fusion rules
  /// @param sexprs List of S-expressions from the DFG
  /// @param minFrequency Minimum frequency for a pattern to be included
  /// @return Fusion rules for patterns that appear frequently
  static std::vector<RewriteRule> extractFusionRules(
      const std::vector<std::string>& sexprs,
      size_t minFrequency = 2);

private:
  /// Add integer arithmetic rules
  static void addIntArithRules(std::vector<RewriteRule>& rules);
  
  /// Add bitwise operation rules
  static void addBitwiseRules(std::vector<RewriteRule>& rules);
  
  /// Remove duplicate rules
  static void deduplicateRules(std::vector<RewriteRule>& rules);
  
  /// Extract sub-patterns from an S-expression
  /// @param sexpr The S-expression to extract patterns from
  /// @param patterns Output map of pattern -> frequency
  static void extractSubPatterns(
      const std::string& sexpr,
      std::map<std::string, DFGPattern>& patterns);
  
  /// Generate a fused operator name from a pattern
  static std::string generateFusedOpName(const DFGPattern& pattern);
};

/// Helper function to create a simple rule
inline RewriteRule makeRule(const std::string& name, 
                            const std::string& lhs, 
                            const std::string& rhs,
                            bool bidir = false) {
  return RewriteRule(name, lhs, rhs, bidir);
}

/// Helper function to create a bidirectional rule
inline RewriteRule makeBidirRule(const std::string& name,
                                  const std::string& lhs,
                                  const std::string& rhs) {
  return RewriteRule(name, lhs, rhs, true);
}

} // namespace egg
} // namespace mlir

#endif // EGG_REWRITE_RULES_H
