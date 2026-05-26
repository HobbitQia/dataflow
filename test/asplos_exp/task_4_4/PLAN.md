# Task 4.4: Hierarchical Contribution Analysis

## Goal
Quantify the incremental contribution of each fusion level.

## Experiment Configs (4 incremental configs, all with inclusive execution)
| Config | Kernel Fusion | DFG Fusion | FU Sharing | How to run |
|--------|:-:|:-:|:-:|------|
| Baseline (Homo) | No | No | No | `run_baseline.sh` (existing data) |
| +DFG | No | Yes | No (dedicated FU per pattern) | `run_opfusion.sh` with no-merge threshold (**needs rebuild**) |
| +DFG+FU | No | Yes | Yes (template sharing) | `run_opfusion.sh` (existing data) |
| Full HF-CGRA | Yes | Yes | Yes | `run_taskfusion.sh` (existing data) |

## Benchmarks
4 apps: ResNet, Llama, Harris, LSTM

## Source Modification for "+DFG" Config
File: `lib/NeuraDialect/Transforms/GraphMining/HardwareTemplate.cpp` line 413
Change: `0.5` → `-1.0` (never merge patterns into shared templates)
This forces each mined pattern to get its own hardware template (dedicated FU).

## Data Sources
- **Baseline**: `e2e/{app}/baseline/kernel_mapped.mlir` ✓ exists
- **+DFG**: needs new run after rebuild → store in `task_4_4/{app}/dfg_only/`
- **+DFG+FU**: `e2e/{app}/opfusion/inclusive/kernel_mapped.mlir` ✓ exists
- **Full**: `e2e/{app}/taskfusion/inclusive/kernel_mapped.mlir` ✓ exists

## Metrics
- **Application speedup** relative to Baseline
- **Area overhead** relative to Baseline
- **Area efficiency** = speedup / (area / baseline_area)

## Scripts
- `run_dfg_only.sh` — runs opfusion pipeline for one app (with no-merge binary)
- `run_all_dfg_only.sh` — runs for all 4 apps
- `collect_results.py` — collects all 4 configs' metrics into CSV
