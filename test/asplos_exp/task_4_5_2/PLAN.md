# Task 4.5.2: Inclusive vs Blocking Execution Ablation

## Goal
Prove inclusive execution is necessary: blocking mode causes mapping failures and throughput loss.

## Experiment Configs
| Config | tile-sharing-mode | Description |
|--------|------------------|-------------|
| Inclusive (HF-CGRA default) | inclusive | Other tiles interleave during multi-cycle ops |
| Blocking | exclusive | Tile blocks during multi-cycle ops |

Both configs use full pipeline: kernel fusion + DFG fusion + FU sharing (taskfusion).

## Benchmarks
4 apps: ResNet, Llama, LSTM, Harris

## Data Sources
All data already exists in `/mnt/public/qjj/dataflow/test/asplos_exp/e2e/{app}/`:
- `baseline/kernel_mapped.mlir` — homogeneous baseline
- `taskfusion/inclusive/kernel_mapped.mlir` — inclusive mode results
- `taskfusion/exclusive/map.log` — exclusive mode (mapping failures logged here)
- `taskfusion/unified/hardware_config.json` — fusion area cost

## Metrics
1. **Mapping failure rate**: per-function from exclusive map.log
2. **Application speedup**: inclusive vs baseline (exclusive all fail → no speedup)
3. **Tile utilization**: weighted average from inclusive mapped output

## Scripts
- `collect_results.py` — extracts all metrics, writes `results.csv` and `per_kernel.csv`
