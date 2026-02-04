// EggSaturation.cpp - Implements the C++ wrapper for egg equality saturation.
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

static thread_local const mlir::egg::AreaMap* g_area_map = nullptr;

// Returns the area for a given operation name via the global area map.
extern "C" uint32_t areaCallback(const char* op_name) {
  if (!g_area_map || !op_name) {
    return 0;
  }
  std::string name(op_name);
  auto it = g_area_map->find(name);
  if (it != g_area_map->end()) {
    return it->second;
  }
  return 0;
}
#endif

namespace mlir {
namespace egg {

// Returns the string representation of rewrite rules in egg-bridge format.
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

// Executes cycle-aware equality saturation with two-phase extraction.
CycleAwareSaturationResult runCycleAwareSaturation(
    const std::string& expr,
    const std::vector<RewriteRule>& rules,
    const AreaMap& area_map,
    const EggConfig& config) {
  
  CycleAwareSaturationResult result;
  
#ifdef EGG_BRIDGE_AVAILABLE
  std::string rules_str = rulesToString(rules);
  struct ::EggConfig config_c;
  config_c.iter_limit = config.iterLimit;
  config_c.node_limit = config.nodeLimit;
  config_c.time_limit_secs = config.timeLimitSecs;

  g_area_map = &area_map;
  struct ::EggCycleResult egg_result = egg_run_saturation_cycle_aware_with_area(
      expr.c_str(),
      rules_str.c_str(),
      config_c,
      areaCallback);

  g_area_map = nullptr;
  if (egg_result.result_expr != nullptr) {
    result.resultExpr = std::string(egg_result.result_expr);
  }
  if (egg_result.error_msg != nullptr) {
    result.errorMsg = std::string(egg_result.error_msg);
  }
  result.iterations = egg_result.iterations;
  result.egraphSize = egg_result.egraph_size;
  result.saturated = egg_result.saturated;
  result.cycleNodeCount = egg_result.cycle_node_count;
  result.offCycleArea = egg_result.off_cycle_area;
  result.astSize = egg_result.ast_size;

  egg_cycle_result_free(egg_result);
#else
  result.errorMsg = "egg-bridge not available (Rust library not built)";
#endif
  
  return result;
}

// Parses an area specification from a YAML file and populates the area_map.
bool parseAreaSpecFile(const std::string& filename, AreaMap& area_map) {
  PPASpec ppa_spec;
  if (!parsePPASpecFile(filename, ppa_spec)) {
    return false;
  }
  area_map = ppa_spec.area_map;
  return true;
}

// Parses a mapping node and populates the target map with operation names and values.
static bool parseMappingToMap(llvm::yaml::MappingNode* mapping, 
                              std::map<std::string, uint32_t>& target_map,
                              const std::string& filename,
                              const std::string& section_name) {
  for (auto &key_value : *mapping) {
    auto *key_node = llvm::dyn_cast<llvm::yaml::ScalarNode>(key_value.getKey());
    if (!key_node) {
      llvm::errs() << "Warning: Skipping non-scalar key in " << section_name 
                   << " section of " << filename << "\n";
      continue;
    }

    llvm::SmallString<64> key_str;
    std::string op_name = key_node->getValue(key_str).str();

    auto *value_node = llvm::dyn_cast<llvm::yaml::ScalarNode>(key_value.getValue());
    if (!value_node) {
      llvm::errs() << "Warning: Skipping non-scalar value for " << op_name
                   << " in " << section_name << " section of " << filename << "\n";
      continue;
    }

    llvm::SmallString<64> value_str;
    llvm::StringRef value_ref = value_node->getValue(value_str);

    long long value = 0;
    if (value_ref.getAsInteger(10, value)) {
      llvm::errs() << "Warning: Invalid " << section_name << " value for " << op_name
                   << " in " << filename << "\n";
      continue;
    }

    target_map[op_name] = static_cast<uint32_t>(value);
  }
  return true;
}

// Parses a PPA specification from a YAML file and populates area_map and latency_map.
bool parsePPASpecFile(const std::string& filename, PPASpec& ppa_spec) {
  auto bufferOrErr = llvm::MemoryBuffer::getFile(filename);
  if (!bufferOrErr) {
    llvm::errs() << "Error: Could not open PPA spec file: " << filename << "\n";
    return false;
  }
  
  llvm::SourceMgr src_mgr;
  src_mgr.AddNewSourceBuffer(std::move(*bufferOrErr), llvm::SMLoc());
  
  llvm::yaml::Stream yaml_stream(src_mgr.getMemoryBuffer(1)->getBuffer(), src_mgr);
  
  for (auto &doc : yaml_stream) {
    auto *root = doc.getRoot();
    if (!root) {
      llvm::errs() << "Error: Empty YAML document in " << filename << "\n";
      return false;
    }
    
    auto *root_mapping = llvm::dyn_cast<llvm::yaml::MappingNode>(root);
    if (!root_mapping) {
      llvm::errs() << "Error: YAML root must be a mapping in " << filename << "\n";
      return false;
    }
    
    for (auto &section : *root_mapping) {
      auto *section_key = llvm::dyn_cast<llvm::yaml::ScalarNode>(section.getKey());
      if (!section_key) {
        continue;
      }

      llvm::SmallString<64> section_name_str;
      std::string section_name = section_key->getValue(section_name_str).str();

      auto *section_mapping = llvm::dyn_cast<llvm::yaml::MappingNode>(section.getValue());
      if (!section_mapping) {
        llvm::errs() << "Warning: Section '" << section_name 
                     << "' is not a mapping in " << filename << "\n";
        continue;
      }

      if (section_name == "area") {
        parseMappingToMap(section_mapping, ppa_spec.area_map, filename, "area");
      } else if (section_name == "latency") {
        parseMappingToMap(section_mapping, ppa_spec.latency_map, filename, "latency");
      } else {
        llvm::errs() << "Warning: Unknown section '" << section_name 
                     << "' in " << filename << "\n";
      }
    }
  }
  
  return true;
}

// Returns the version of the egg-bridge library.
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
