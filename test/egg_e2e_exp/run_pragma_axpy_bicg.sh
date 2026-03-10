#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
NEURA_OPT="$WORKSPACE_ROOT/build/tools/mlir-neura-opt/mlir-neura-opt"
BENCH="$WORKSPACE_ROOT/test/benchmark"
ARCH="$SCRIPT_DIR/architecture_all_tiles_mem.yaml"
TIMEOUT=600

LOG="$SCRIPT_DIR/pragma_axpy_bicg_results.log"
echo "=== pragma unroll baseline: axpy + bicg ===" | tee "$LOG"
echo "date: $(date)" | tee -a "$LOG"

# -----------------------------------------------------------------------
# helper: compile C/C++ -> LLVM IR -> MLIR
# compile_to_mlir <name> <src> <flags> <outdir>
compile_to_mlir() {
  local name=$1 src=$2 flags=$3 outdir=$4
  local ll_full="$outdir/kernel-pragma-${name}-full.ll"
  local ll_only="$outdir/kernel-pragma-${name}.ll"
  local mlir_out="$outdir/kernel-pragma-${name}.mlir"
  clang-12 -S -emit-llvm $flags -o "$ll_full" "$src" 2>/dev/null
  llvm-extract -S --rfunc=".*kernel.*" "$ll_full" -o "$ll_only" 2>/dev/null
  mlir-translate --import-llvm "$ll_only" -o "$mlir_out" 2>/dev/null
  echo "$mlir_out"
}

# helper: run mapping pipeline
run_mapping() {
  local input=$1 output=$2 logfile=$3 workdir=$4
  pushd "$workdir" > /dev/null
  timeout $TIMEOUT "$NEURA_OPT" \
    --architecture-spec="$ARCH" \
    --assign-accelerator \
    --lower-llvm-to-neura \
    --promote-input-arg-to-const \
    --fold-constant \
    --canonicalize-return \
    --canonicalize-live-in \
    --leverage-predicated-value \
    --transform-ctrl-to-data-flow \
    --fold-constant \
    --insert-data-mov \
    --map-to-accelerator="mapping-strategy=heuristic" \
    --generate-code \
    "$input" -o "$output" > "$logfile" 2>&1 || true
  popd > /dev/null
}

# helper: extract metrics from mapped mlir
extract_metrics() {
  local mapped=$1 logfile=$2
  local ii rec res dfg
  ii=$(grep -oP 'compiled_ii = \K\d+' "$mapped" 2>/dev/null | head -1)
  rec=$(grep -oP 'rec_mii = \K\d+' "$mapped" 2>/dev/null | head -1)
  res=$(grep -oP 'res_mii = \K\d+' "$mapped" 2>/dev/null | head -1)
  [ -z "$rec" ] && rec=$(grep -oP 'Calculated Recurrence MII: \K\d+' "$logfile" 2>/dev/null | head -1)
  # count dfg nodes: top-level neura ops excluding data_mov/yield, fused_op counts as 1
  dfg=$(python3 - "$mapped" <<'EOF'
import sys
f = open(sys.argv[1])
in_fused, depth, fused, regular = False, 0, 0, 0
for line in f:
    s = line.rstrip()
    if not in_fused and ('= "neura.fused_op"' in s or '"neura.fused_op"' in s):
        fused += 1; in_fused = True
        depth = s.count('{') - s.count('}')
        if depth <= 0: in_fused = False
        continue
    if in_fused:
        depth += s.count('{') - s.count('}')
        if depth <= 0: in_fused = False
        continue
    if 'neura.' in s and 'neura.data_mov' not in s and 'neura.yield' not in s:
        regular += 1
print(fused + regular)
EOF
  )
  echo "  compiled_ii=${ii:-?}  rec_mii=${rec:-?}  res_mii=${res:-?}  dfg_nodes=${dfg:-?}"
}

# ============================================================
echo "" | tee -a "$LOG"
echo "### AXPY (kN=1024, pragma clang loop unroll_count)" | tee -a "$LOG"
AXPY_DIR="$SCRIPT_DIR/axpy"
declare -A AXPY_SRC
AXPY_SRC[1]="$AXPY_DIR/axpy_large_uf1.cpp"
AXPY_SRC[2]="$AXPY_DIR/axpy_large_uf2.cpp"
AXPY_SRC[4]="$AXPY_DIR/axpy_large_uf4.cpp"

for uf in 1 2 4; do
  echo -n "axpy uf=${uf}: " | tee -a "$LOG"
  mlir=$(compile_to_mlir "axpy-uf${uf}" "${AXPY_SRC[$uf]}" \
    "-O3 -fno-vectorize -fno-unroll-loops -std=c++17" "$AXPY_DIR")
  mapped="$AXPY_DIR/kernel-pragma-axpy-uf${uf}-mapped.mlir"
  logf="$AXPY_DIR/pragma_axpy_uf${uf}.log"
  run_mapping "$mlir" "$mapped" "$logf" "$AXPY_DIR"
  if [ -f "$mapped" ]; then
    extract_metrics "$mapped" "$logf" | tee -a "$LOG"
  else
    echo "  FAILED (see $logf)" | tee -a "$LOG"
  fi
done

# ============================================================
echo "" | tee -a "$LOG"
echo "### BICG (standalone, integer, M=N=256, pragma clang loop unroll_count on innermost j-loop)" | tee -a "$LOG"
BICG_DIR="$SCRIPT_DIR/bicg"
BICG_FLAGS="-O3 -fno-vectorize -fno-unroll-loops -std=c11"
declare -A BICG_SRC
BICG_SRC[1]="$BICG_DIR/bicg_standalone_uf1.c"
BICG_SRC[2]="$BICG_DIR/bicg_standalone_uf2.c"
BICG_SRC[4]="$BICG_DIR/bicg_standalone_uf4.c"

for uf in 1 2 4; do
  echo -n "bicg uf=${uf}: " | tee -a "$LOG"
  mlir=$(compile_to_mlir "bicg-uf${uf}" "${BICG_SRC[$uf]}" "$BICG_FLAGS" "$BICG_DIR")
  mapped="$BICG_DIR/kernel-pragma-bicg-uf${uf}-mapped.mlir"
  logf="$BICG_DIR/pragma_bicg_uf${uf}.log"
  run_mapping "$mlir" "$mapped" "$logf" "$BICG_DIR"
  if [ -f "$mapped" ]; then
    extract_metrics "$mapped" "$logf" | tee -a "$LOG"
  else
    echo "  FAILED (see $logf)" | tee -a "$LOG"
  fi
done

echo "" | tee -a "$LOG"
echo "=== done ===" | tee -a "$LOG"
