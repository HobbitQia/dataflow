# Task 4.5.3: Kernel-Level Fusion Strategy Ablation

## Goal
Prove metric-based fusion decision is better than aggressive or conservative strategies.

## Experiment Configs
| Strategy | Kernel Fusion | Decision |
|----------|:-:|------|
| **Metric-based (HF-CGRA)** | Yes | Rec_MII/Res_MII/fanout check |
| **Always Fuse** | Yes | Skip profitability check |
| **PC-Only** | Partial | Only producer-consumer, no sibling |
| **No Kernel Fusion** | No | Skip --fuse-task entirely |

All configs enable DFG fusion + FU sharing (isolating kernel-level variable).

## Data Sources
- **Metric-based**: `e2e/{app}/taskfusion/inclusive/` ✓ exists
- **No fusion**: `e2e/{app}/opfusion/inclusive/` ✓ exists
- **Always fuse**: new run → `task_4_5_3/{app}/always_fuse/`
- **PC-only**: new run → `task_4_5_3/{app}/pc_only/`

## Source Modifications
1. **Always fuse**: `FuseTaskPass.cpp` — make `isFusionProfitable()` always return true
2. **PC-only**: `FuseTaskPass.cpp` — remove SiblingTaskFusion pattern registration

## Metrics
- Application speedup (relative to homogeneous baseline)
- Mapping success rate
- Tile utilization (weighted average)

## Scripts
- `run_variant.sh` — runs taskfusion pipeline for one app
- `collect_results.py` — collects all 4 strategies' metrics
