# Plaid Baseline

This directory contains a minimally invasive Plaid-style baseline built on top
of the existing `test/asplos_exp/e2e` flow in `dataflow`.

Scope of this baseline:

- Reuse the existing C++/Affine/LLVM/Neura lowering flow.
- Do not modify the main `mlir-neura-opt` passes or the mapper.
- Approximate Plaid at the DFG/FU/architectural-support levels only.
- Keep kernel-level orchestration disabled. Plaid runs on the multi-function app
  decomposition and only introduces per-kernel 3-node motif fusion.

Approximation choices:

- Motifs are extracted greedily from three consecutive SSA-producing ops inside
  each `neura.kernel`.
- Supported 3-node structures are `fan_in`, `fan_out`, and `unicast`. Dense
  3-node chains with an extra shortcut edge are kept as a `unicast` schedule
  approximation.
- Motifs are materialized as `neura.fused_op` so the existing mapper can treat
  them as single multi-cycle tile occupants.
- Tile sharing is always `exclusive`.
- Analytical execution latency:
  - `fan_in` / `fan_out`: 2 cycles
  - `unicast`: 3 cycles
- Analytical area uses `area_spec_plaid.yaml` instead of RTL synthesis.

Main entry points:

- `scripts/run_plaid_single.sh APP UF`
- `scripts/run_plaid_sweep_single.sh APP UF_SPEC`
- `scripts/run_all_plaid.sh`
- `scripts/collect_plaid_results.py`

Outputs:

- `<app>/sweep/lowered/uf_<tag>/...`
- `<app>/sweep/baseline/uf_<tag>/...`
- `<app>/sweep/plaid/uf_<tag>/exclusive/...`
- `results/plaid_sweep_summary.csv`
- `results/plaid_best_latency.csv`
- `results/plaid_best_area_eff.csv`

Fallback behavior:

- If Plaid motif mapping fails or times out for a configuration, the flow can
  conservatively fall back to `baseline_passthrough` by reusing the baseline
  mapped MLIR for that configuration.
- The collector marks such rows as
  `motif_breakdown=fallback:mapper_failed_or_timed_out`.
- For these fallback rows, Plaid area is conservatively reset to the baseline
  area so the reported speedup and area-efficiency speedup both remain `1.0`.
