#ifndef NEURA_MAPPING_STATE_H
#define NEURA_MAPPING_STATE_H

#include "NeuraDialect/Architecture/Architecture.h"
#include "mlir/IR/Operation.h"
#include "llvm/Support/raw_ostream.h"
#include <optional>
#include <set>
#include <vector>

namespace mlir {
namespace neura {

//===----------------------------------------------------------------------===//
// HardwareTemplateInfo - Maps operations to hardware template IDs.
//
// Parsed from hardware_config.json, this provides information about which
// hardware template(s) can support a given operation. Used during mapping to
// detect hardware conflicts: two ops can coexist on the same tile during
// multi-cycle pipeline occupation only if they share a common template.
//===----------------------------------------------------------------------===//
struct HardwareTemplateInfo {
  // Maps operation name (e.g., "neura.add") to set of template IDs
  // that can support this operation as a single op.
  std::map<std::string, std::set<int>> single_op_to_templates;

  // Maps fused_op pattern_name to the template ID it belongs to.
  std::map<std::string, int> fused_op_to_template;

  // Checks if two operations (given by name) can share a hardware template.
  // Returns true if they have at least one common template.
  bool areTemplateCompatible(const std::string &op_a,
                             const std::string &op_b) const {
    auto it_a = single_op_to_templates.find(op_a);
    auto it_b = single_op_to_templates.find(op_b);
    if (it_a == single_op_to_templates.end() ||
        it_b == single_op_to_templates.end()) {
      // If either op is not in the template info, we conservatively assume no
      // conflict (backward compatibility for ops without template info).
      return true;
    }
    // Check for intersection
    for (int tid : it_a->second) {
      if (it_b->second.count(tid))
        return true;
    }
    return false;
  }

  // Returns the set of template IDs an operation can use.
  std::set<int> getTemplatesForOp(const std::string &op_name) const {
    auto it = single_op_to_templates.find(op_name);
    if (it != single_op_to_templates.end())
      return it->second;
    auto fit = fused_op_to_template.find(op_name);
    if (fit != fused_op_to_template.end())
      return {fit->second};
    return {};
  }

  bool empty() const {
    return single_op_to_templates.empty() && fused_op_to_template.empty();
  }
};

// Occupy status for multi-cycle pipeline support.
// These states define how a tile/FU is occupied at a given time step.
#define SINGLE_OCCUPY     0 // A single-cycle op is in the FU (exclusive)
#define START_PIPE_OCCUPY 1 // A multi-cycle op starts in the FU
#define END_PIPE_OCCUPY   2 // A multi-cycle op ends in the FU
#define IN_PIPE_OCCUPY    3 // A multi-cycle op is occupying the FU (pipelined)

// Represents a spatial-temporal location: (resource, time_step)
struct MappingLoc {
  BasicResource *resource;
  int time_step;

  bool operator==(const MappingLoc &other) const {
    return resource->getKind() == other.resource->getKind() &&
           resource->getId() == other.resource->getId() &&
           time_step == other.time_step;
  }

  bool operator<(const MappingLoc &other) const {
    if (resource->getKind() != other.resource->getKind()) {
      return resource->getKind() < other.resource->getKind();
    }
    if (resource->getId() != other.resource->getId()) {
      return resource->getId() < other.resource->getId();
    }
    return time_step < other.time_step;
  }
};

} // namespace neura
} // namespace mlir

namespace std {
template <> struct hash<mlir::neura::MappingLoc> {
  std::size_t operator()(const mlir::neura::MappingLoc &loc) const {
    std::size_t h1 =
        std::hash<int>()(static_cast<int>(loc.resource->getKind()));
    std::size_t h2 = std::hash<int>()(loc.resource->getId());
    std::size_t h3 = std::hash<int>()(loc.time_step);
    return h1 ^ (h2 << 1) ^ (h3 << 2);
  }
};
} // namespace std

namespace mlir {
namespace neura {

// Tracks placement and routing of ops on the CGRA.
class MappingState {
public:
  MappingState(const Architecture &arch, int II, bool is_spatial_only,
               const std::string &tile_sharing_mode = "exclusive");
  MappingState(const Architecture &arch, int II, bool is_spatial_only,
               const HardwareTemplateInfo &hw_template_info,
               const std::string &tile_sharing_mode = "exclusive");
  // Binds a (tile/link, time_step) location to an operation with default
  // SINGLE_OCCUPY status.
  bool bindOp(const MappingLoc &loc, Operation *op);

  // Binds a (tile/link, time_step) location to an operation with specified
  // occupy status for multi-cycle pipeline support.
  bool bindOp(const MappingLoc &loc, Operation *op, int occupy_status);

  // Binds multiple locations for a multi-cycle operation.
  // This sets START_PIPE_OCCUPY at start_time, IN_PIPE_OCCUPY for intermediate
  // times, and END_PIPE_OCCUPY at end_time-1.
  bool bindMultiCycleOp(BasicResource *resource, int start_time, int latency,
                        Operation *op);

  // Unbinds an operation from its (tile/link, time_step) location,
  // which is useful for backtracking.
  void unbindOp(Operation *op);

  // Checks if a (tile/link, time_step) is available (unoccupied).
  // Note that the check is performed in II granularity.
  // For example, if II is 4, and we want to check (tile 2, step 5), then
  // it will check (tile 2, step 1), (tile 2, step 5), (tile 2, step 9), etc.
  bool isAvailableAcrossTime(const MappingLoc &loc) const;

  // Checks if a location is available for a specific occupy status.
  // This implements the pipeline-aware availability checking:
  // - SINGLE_OCCUPY: only available if location is completely free
  // - START_PIPE_OCCUPY: available if free or IN_PIPE_OCCUPY or END_PIPE_OCCUPY
  // - END_PIPE_OCCUPY: available if free or IN_PIPE_OCCUPY or START_PIPE_OCCUPY
  // - IN_PIPE_OCCUPY: always available (can pipeline with any status)
  bool isAvailableForOccupyStatus(const MappingLoc &loc,
                                  int new_occupy_status) const;

  // Template-aware version of isAvailableForOccupyStatus.
  // When a multi-cycle op occupies a tile in IN_PIPE_OCCUPY state, another op
  // can only share the tile if both ops belong to the same hardware template.
  // The new_op parameter is the operation being placed (used to determine its
  // template).
  bool isAvailableForOccupyStatusWithTemplate(const MappingLoc &loc,
                                              int new_occupy_status,
                                              Operation *new_op) const;

  // Gets the hardware template info associated with this mapping state.
  const HardwareTemplateInfo &getHardwareTemplateInfo() const {
    return hw_template_info;
  }

  // Returns true if the tile sharing mode is "exclusive".
  bool isExclusiveMode() const { return tile_sharing_mode == "exclusive"; }

  // Returns the tile sharing mode string.
  const std::string &getTileSharingMode() const { return tile_sharing_mode; }

  // Checks if a tile is available for data_mov routing at the given time step.
  // In exclusive mode, tiles occupied by multi-cycle ops (pipeline statuses)
  // are not available for routing. In inclusive mode, always returns true.
  bool isTileAvailableForRouting(Tile *tile, int time_step) const;

  // Gets the occupy status at a specific location across time domain.
  // Returns -1 if the location is not occupied.
  int getOccupyStatusAcrossTime(const MappingLoc &loc) const;

  // Checks if a hardware resource is available across a time range.
  // This function leverages the isAvailableAcrossTime function in each
  // time step.
  bool isAvailableAcrossTimeInRange(BasicResource *resource, int start_time,
                                    int exclusive_end_time) const;

  // Gets the operation at a specific (tile/link, time_step) location.
  std::optional<Operation *> getOpAt(MappingLoc loc) const;

  std::optional<Operation *> getOpAtLocAcrossTime(MappingLoc loc) const;

  // Counts the number of operations at a specific resource across time steps.
  int countOpsAtResource(BasicResource *resource) const;

  // Gets all MRRG nodes allocated to a given op.
  const std::vector<MappingLoc> &getAllLocsOfOp(Operation *op) const;

  // Reserves links for an move operation.
  void reserveRoute(Operation *op, ArrayRef<MappingLoc> path);

  // Releases links for an move operation.
  void releaseRoute(Operation *op);

  // Gets neighboring tiles on next step of a given MappingLoc.
  std::vector<MappingLoc> getNextStepTiles(MappingLoc loc) const;

  //   // Gets neighboring links on next step of a given MappingLoc.
  //   const std::vector<MappingLoc> &getNextStepLinks(MappingLoc loc) const;

  //   // Gets neighboring tiles on current step of a given MappingLoc.
  //   const std::vector<MappingLoc> &getCurrentStepTiles(MappingLoc loc) const;

  // Gets neighboring links on current step of a given MappingLoc.
  std::vector<MappingLoc> getCurrentStepLinks(MappingLoc loc) const;

  // Gets the target initiation interval (II) for the mapping.
  int getII() const { return II; }

  // Embeds the mapping states onto the mapped operations.
  void encodeMappingState();

  void dumpOpToLocs(llvm::raw_ostream &os = llvm::errs()) const;

  // Getters for state information.
  const std::map<MappingLoc, std::vector<std::pair<int, Operation *>>> &
  getOccupiedLocs() const {
    return this->occupied_locs;
  }
  const std::map<MappingLoc, Operation *> &getLocToOp() const {
    return this->loc_to_op;
  }
  const std::map<Operation *, std::vector<MappingLoc>> &getOpToLocs() const {
    return this->op_to_locs;
  }

  // Setters for state information.
  void setOccupiedLocs(
      const std::map<MappingLoc, std::vector<std::pair<int, Operation *>>>
          &locs) {
    this->occupied_locs = locs;
  }
  void setLocToOp(const std::map<MappingLoc, Operation *> &loc_to_op) {
    this->loc_to_op = loc_to_op;
  }
  void setOpToLocs(
      const std::map<Operation *, std::vector<MappingLoc>> &op_to_locs) {
    this->op_to_locs = op_to_locs;
  }

private:
  // Initiation interval.
  int II;
  bool is_spatial_only;
  static constexpr int kMaxSteps = 10;

  // Tile sharing mode: "exclusive" (default) or "inclusive".
  // In exclusive mode, a multi-cycle op fully locks the tile for all its
  // cycles; no other op or data_mov routing can share that tile.
  // In inclusive mode, ops without hardware conflicts and without
  // start/end cycle collisions may share the tile, and data_mov can route
  // through occupied tiles.
  std::string tile_sharing_mode;

  // Hardware template info for template-aware conflict detection.
  HardwareTemplateInfo hw_template_info;

  // Maps location to a list of (occupy_status, operation) pairs.
  // Multiple ops can occupy the same location with compatible pipeline states.
  std::map<MappingLoc, std::vector<std::pair<int, Operation *>>> occupied_locs;
  std::map<MappingLoc, Operation *> loc_to_op;
  std::map<Operation *, std::vector<MappingLoc>> op_to_locs;
};

} // namespace neura
} // namespace mlir

namespace mlir {
namespace neura {
class MappingStateSnapshot {
public:
  MappingStateSnapshot(const MappingState &mapping_state);

  void restore(MappingState &mapping_state);

  std::map<Operation *, std::vector<MappingLoc>> getOpToLocs() {
    return this->op_to_locs;
  }

private:
  std::map<MappingLoc, std::vector<std::pair<int, Operation *>>> occupied_locs;
  std::map<MappingLoc, Operation *> loc_to_op;
  std::map<Operation *, std::vector<MappingLoc>> op_to_locs;
};
} // namespace neura
} // namespace mlir

#endif // NEURA_MAPPING_STATE_H
