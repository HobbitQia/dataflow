# Task 4.5.1: DFG-Level Internal Ablation

## Goal
Prove each DFG-level design decision is necessary through ablation.

## Experiment Variants
| Variant | Hw-cost filter | Critical-path | Node duplication |
|---------|:-:|:-:|:-:|
| **Full DFG** | ✓ | ✓ | N/A |
| **w/o hw-cost** | ✗ | ✓ | N/A |
| **w/o critical-path** | ✓ | ✗ | N/A |

Note: Node duplication (DupHighFanout) is NOT implemented in the codebase, so that variant is skipped.

## Benchmarks
13 single kernels (uf1): axpy, bicg, conv, dtw, fft, fir, gemm, gemv, histogram, latnrm, mvt, relu, spmv

## Source Modifications
1. **w/o hw-cost**: `HardwareTemplate.cpp` line 413: change `0.5` → `-1.0`
   (never merge → each pattern gets dedicated FU → max area overhead)
2. **w/o critical-path**: `GraMi.cpp` line 349: change `10.0` → `1.0`
   (equal weight for critical and non-critical → no priority)

## Data Sources
- **Full DFG**: existing `{kernel}/uf1/inclusive/` ✓
- **w/o hw-cost**: new run → `task_4_5_1/{kernel}/wo_hwcost/`
- **w/o critical-path**: new run → `task_4_5_1/{kernel}/wo_critical/`
- **Baseline (nofusion)**: existing `{kernel}/uf1/nofusion/` ✓

## Metrics
- II (Initiation Interval)
- Speedup (baseline_ii / variant_ii)
- Area overhead (relative to baseline)
- Number of patterns mined
- Area efficiency (speedup / area_ratio)

## Scripts
- `run_single_kernel.sh` — runs one kernel for one variant
- `run_all.sh` — runs all kernels for a given variant
- `collect_results.py` — collects all variants' metrics
