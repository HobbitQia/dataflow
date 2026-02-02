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

// Configuration for the equality saturation runner.
struct EggConfig {
  uint32_t iterLimit = 30;
  uint32_t nodeLimit = 10000;
  uint32_t timeLimitSecs = 60;
};

// Result from running cycle-aware equality saturation.
struct CycleAwareSaturationResult {
  std::string resultExpr;
  std::string errorMsg;
  uint32_t iterations = 0;
  uint32_t egraphSize = 0;
  bool saturated = false;
  uint32_t cycleNodeCount = 0;
  uint32_t offCycleArea = 0;
  uint32_t astSize = 0;

  bool isSuccess() const { return errorMsg.empty(); }
};

struct RewriteRule {
  std::string name;
  std::string lhs;
  std::string rhs;
  bool bidirectional;
  
  RewriteRule(const std::string& name, const std::string& lhs, 
              const std::string& rhs, bool bidir = false)
    : name(name), lhs(lhs), rhs(rhs), bidirectional(bidir) {}
};

using AreaMap = std::map<std::string, uint32_t>;

// Runs cycle-aware equality saturation with two-phase extraction.
CycleAwareSaturationResult runCycleAwareSaturation(
    const std::string& expr,
    const std::vector<RewriteRule>& rules,
    const AreaMap& areaMap,
    const EggConfig& config = EggConfig());

// Parses area specification from a YAML file (op_name: area_value per line).
bool parseAreaSpecFile(const std::string& filename, AreaMap& areaMap);

// Converts rewrite rules to the string format expected by egg-bridge.
std::string rulesToString(const std::vector<RewriteRule>& rules);

// Returns the version of the egg-bridge library.
std::string getVersion();

// Returns the global area spec file path (set via --area-spec).
std::string getAreaSpecFile();

} // namespace egg
} // namespace mlir

#endif // EGG_SATURATION_H
