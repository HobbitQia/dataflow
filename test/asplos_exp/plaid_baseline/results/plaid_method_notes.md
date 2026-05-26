# Plaid Baseline Notes

- Motif extraction uses a deterministic greedy pass over lowered Neura IR.
- Only 3-node motifs are modeled.
- Mapping reuses the existing `mlir-neura-opt` mapper with `tile-sharing-mode=exclusive`.
- Plaid PCU timing is approximated through `neura.fused_op` latency:
  - `fan_in` / `fan_out`: 2 cycles
  - `unicast`: 3 cycles
- Area-efficiency is computed with the analytical model in `area_spec_plaid.yaml`.
- Run status on 2026-03-22:
  - `resnet`, `llama`, and `lstm` produced valid baseline/Plaid mapped outputs and are included in the summary CSVs.
  - `harris` Plaid `exclusive` mapping still failed to converge reliably even after longer timeout retries.
  - To keep the baseline sweep complete, failed Plaid mappings are conservatively converted to `baseline_passthrough`.
  - These rows are explicitly marked as `fallback:mapper_failed_or_timed_out`, with `motif_count = 0`, baseline latency reused, and baseline area reused so the fallback remains conservative (`speedup = 1.0`, `ae_speedup = 1.0`).
