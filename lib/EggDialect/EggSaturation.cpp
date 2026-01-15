// EggSaturation.cpp - C++ wrapper implementation for egg equality saturation
#include "EggDialect/EggSaturation.h"

#include <sstream>
#include <fstream>
#include <cstring>

#include "llvm/ADT/SmallString.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/YAMLParser.h"
#include "llvm/Support/raw_ostream.h"

#ifdef EGG_BRIDGE_AVAILABLE
// Include the generated C header from egg-bridge
extern "C" {
#include "egg_bridge.h"
}

// Thread-local storage for the area map used by the callback
static thread_local const mlir::egg::AreaMap* g_areaMap = nullptr;

// C callback function for area lookup
extern "C" uint32_t areaCallback(const char* opName) {
  if (!g_areaMap || !opName) {
    return 0;  // Default area for unknown ops
  }
  std::string name(opName);
  auto it = g_areaMap->find(name);
  if (it != g_areaMap->end()) {
    return it->second;
  }
  return 0;  // Default area for ops not in the map
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

CycleAwareSaturationResult runCycleAwareSaturation(
    const std::string& expr,
    const std::vector<RewriteRule>& rules,
    const AreaMap& areaMap,
    const EggConfig& config) {
  
  CycleAwareSaturationResult result;
  
#ifdef EGG_BRIDGE_AVAILABLE
  // Convert rules to string format
  std::string rulesStr = rulesToString(rules);
  
  // Convert config
  struct ::EggConfig configC;
  configC.iter_limit = config.iterLimit;
  configC.node_limit = config.nodeLimit;
  configC.time_limit_secs = config.timeLimitSecs;
  
  // Set the thread-local area map for the callback
  g_areaMap = &areaMap;
  
  // Call the Rust library with area callback
  struct ::EggCycleResult eggResult = egg_run_saturation_cycle_aware_with_area(
      expr.c_str(), 
      rulesStr.c_str(), 
      configC,
      areaCallback);
  
  // Clear the thread-local pointer
  g_areaMap = nullptr;
  
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
  result.cycleNodeCount = eggResult.cycle_node_count;
  result.offCycleArea = eggResult.off_cycle_area;
  result.astSize = eggResult.ast_size;
  
  // Free the C strings
  egg_cycle_result_free(eggResult);
#else
  result.errorMsg = "egg-bridge not available (Rust library not built)";
#endif
  
  return result;
}

bool parseAreaSpecFile(const std::string& filename, AreaMap& areaMap) {
  // Read the file
  auto bufferOrErr = llvm::MemoryBuffer::getFile(filename);
  if (!bufferOrErr) {
    llvm::errs() << "Error: Could not open area spec file: " << filename << "\n";
    return false;
  }
  
  llvm::SourceMgr srcMgr;
  srcMgr.AddNewSourceBuffer(std::move(*bufferOrErr), llvm::SMLoc());
  
  llvm::yaml::Stream yamlStream(srcMgr.getMemoryBuffer(1)->getBuffer(), srcMgr);
  
  for (auto &doc : yamlStream) {
    auto *root = doc.getRoot();
    if (!root) {
      llvm::errs() << "Error: Empty YAML document in " << filename << "\n";
      return false;
    }
    
    auto *mapping = llvm::dyn_cast<llvm::yaml::MappingNode>(root);
    if (!mapping) {
      llvm::errs() << "Error: YAML root must be a mapping in " << filename << "\n";
      return false;
    }
    
    for (auto &keyValue : *mapping) {
      // Get the key (operation name)
      auto *keyNode = llvm::dyn_cast<llvm::yaml::ScalarNode>(keyValue.getKey());
      if (!keyNode) {
        llvm::errs() << "Warning: Skipping non-scalar key in " << filename << "\n";
        continue;
      }
      
      llvm::SmallString<64> keyStr;
      std::string opName = keyNode->getValue(keyStr).str();
      
      // Get the value (area cost)
      auto *valueNode = llvm::dyn_cast<llvm::yaml::ScalarNode>(keyValue.getValue());
      if (!valueNode) {
        llvm::errs() << "Warning: Skipping non-scalar value for " << opName 
                     << " in " << filename << "\n";
        continue;
      }
      
      llvm::SmallString<64> valueStr;
      llvm::StringRef valueRef = valueNode->getValue(valueStr);
      
      long long areaValue = 0;
      if (valueRef.getAsInteger(10, areaValue)) {
        llvm::errs() << "Warning: Invalid area value for " << opName 
                     << " in " << filename << "\n";
        continue;
      }
      
      areaMap[opName] = static_cast<uint32_t>(areaValue);
    }
  }
  
  return true;
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
