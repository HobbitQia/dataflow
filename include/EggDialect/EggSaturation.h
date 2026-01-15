// EggSaturation.h - C++ wrapper for egg equality saturation
#ifndef EGG_SATURATION_H
#define EGG_SATURATION_H

#include <string>
#include <vector>
#include <optional>
#include <functional>
#include <map>

namespace mlir {
namespace egg {

/// Configuration for the equality saturation runner
struct EggConfig {
  /// Maximum number of iterations
  uint32_t iterLimit = 30;
  /// Maximum number of nodes in the e-graph
  uint32_t nodeLimit = 10000;
  /// Time limit in seconds (0 = no limit)
  uint32_t timeLimitSecs = 60;
};

/// Result from running equality saturation
struct SaturationResult {
  /// The optimized expression (empty if error)
  std::string resultExpr;
  /// Error message (empty if success)
  std::string errorMsg;
  /// Number of iterations performed
  uint32_t iterations = 0;
  /// Final e-graph size (number of e-classes)
  uint32_t egraphSize = 0;
  /// Whether saturation was reached
  bool saturated = false;
  
  /// Check if the result is successful
  bool isSuccess() const { return errorMsg.empty(); }
};

/// Result from running cycle-aware equality saturation
struct CycleAwareSaturationResult {
  /// The optimized expression (empty if error)
  std::string resultExpr;
  /// Error message (empty if success)
  std::string errorMsg;
  /// Number of iterations performed
  uint32_t iterations = 0;
  /// Final e-graph size (number of e-classes)
  uint32_t egraphSize = 0;
  /// Whether saturation was reached
  bool saturated = false;
  /// Number of nodes on cycles in the extracted expression
  uint32_t cycleNodeCount = 0;
  /// Total area of nodes NOT on cycles
  uint32_t offCycleArea = 0;
  /// Total AST size
  uint32_t astSize = 0;
  
  /// Check if the result is successful
  bool isSuccess() const { return errorMsg.empty(); }
};

/// A rewrite rule for equality saturation
struct RewriteRule {
  std::string name;
  std::string lhs;
  std::string rhs;
  bool bidirectional;
  
  RewriteRule(const std::string& name, const std::string& lhs, 
              const std::string& rhs, bool bidir = false)
    : name(name), lhs(lhs), rhs(rhs), bidirectional(bidir) {}
};

/// Type alias for area map (operation name -> area cost)
using AreaMap = std::map<std::string, uint32_t>;

/// Run equality saturation on an expression with the given rules
///
/// @param expr The initial expression in S-expression format
/// @param rules The rewrite rules to apply
/// @param config Configuration for the runner
/// @return The result of equality saturation
SaturationResult runSaturation(
    const std::string& expr,
    const std::vector<RewriteRule>& rules,
    const EggConfig& config = EggConfig());

/// Run cycle-aware equality saturation with two-phase extraction
///
/// Phase 1: Minimize nodes on cycles (critical path)
/// Phase 2: Minimize area for non-cycle nodes
///
/// @param expr The initial expression in S-expression format
/// @param rules The rewrite rules to apply
/// @param areaMap Map from operation name to area cost (default 0 for unknown ops)
/// @param config Configuration for the runner
/// @return The result of cycle-aware equality saturation
CycleAwareSaturationResult runCycleAwareSaturation(
    const std::string& expr,
    const std::vector<RewriteRule>& rules,
    const AreaMap& areaMap,
    const EggConfig& config = EggConfig());

/// Parse area specification from a YAML file
///
/// Expected YAML format:
///   op_name1: area_value1
///   op_name2: area_value2
///   ...
///
/// @param filename Path to the YAML file
/// @param areaMap Output map to populate with area values
/// @return true on success, false on error
bool parseAreaSpecFile(const std::string& filename, AreaMap& areaMap);

/// Convert rewrite rules to the string format expected by egg-bridge
std::string rulesToString(const std::vector<RewriteRule>& rules);

/// Get the version of the egg-bridge library
std::string getVersion();

} // namespace egg
} // namespace mlir

#endif // EGG_SATURATION_H
