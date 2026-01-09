// EggSaturation.cpp - C++ wrapper implementation for egg equality saturation
#include "EggDialect/EggSaturation.h"

#include <sstream>
#include <cstring>

#ifdef EGG_BRIDGE_AVAILABLE
// Include the generated C header from egg-bridge
extern "C" {
#include "egg_bridge.h"
}
#endif

namespace mlir {
namespace egg {

std::string rulesToString(const std::vector<RewriteRule>& rules) {
  std::ostringstream oss;
  for (const auto& rule : rules) {
    oss << rule.name << ": " << rule.lhs;
    if (rule.bidirectional) {
      oss << " <=> ";
    } else {
      oss << " => ";
    }
    oss << rule.rhs << "\n";
  }
  return oss.str();
}

SaturationResult runSaturation(
    const std::string& expr,
    const std::vector<RewriteRule>& rules,
    const EggConfig& config) {
  
  SaturationResult result;
  
#ifdef EGG_BRIDGE_AVAILABLE
  // Convert rules to string format
  std::string rulesStr = rulesToString(rules);
  
  // Convert config
  struct ::EggConfig configC;
  configC.iter_limit = config.iterLimit;
  configC.node_limit = config.nodeLimit;
  configC.time_limit_secs = config.timeLimitSecs;
  
  // Call the Rust library
  struct ::EggResult eggResult = egg_run_saturation(
      expr.c_str(), 
      rulesStr.c_str(), 
      configC);
  
  // Convert result
  if (eggResult.result_expr != nullptr) {
    result.resultExpr = std::string(eggResult.result_expr);
  }
  if (eggResult.error_msg != nullptr) {
    result.errorMsg = std::string(eggResult.error_msg);
  }
  result.iterations = eggResult.iterations;
  result.egraphSize = eggResult.egraph_size;
  result.saturated = eggResult.saturated;
  
  // Free the C strings
  egg_result_free(eggResult);
#else
  result.errorMsg = "egg-bridge not available (Rust library not built)";
#endif
  
  return result;
}

std::string getVersion() {
#ifdef EGG_BRIDGE_AVAILABLE
  const char* version = egg_version();
  return std::string(version);
#else
  return "unavailable";
#endif
}

} // namespace egg
} // namespace mlir
