#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
ARCH=/mnt/public/qjj/dataflow/test/egg_e2e_exp/architecture_all_tiles_mem_4x4.yaml
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
LOG=$E2E/baseline_newkernels_results.log

PIPELINE="--architecture-spec=$ARCH \
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
  --map-to-accelerator=mapping-strategy=heuristic"

compile_to_mlir() {
  local src="$1" flags="$2" out_mlir="$3" func_re="${4:-.*kernel.*}"
  local base="${out_mlir%.mlir}"
  clang-12 -S -emit-llvm $flags -o "${base}_full.ll" "$src"
  llvm-extract -S --rfunc="$func_re" "${base}_full.ll" -o "${base}.ll"
  mlir-translate --import-llvm "${base}.ll" -o "$out_mlir"
}

run_mapping() {
  local in_mlir="$1" out_mlir="$2"
  $NEURA_OPT $PIPELINE "$in_mlir" -o "$out_mlir" >/dev/null 2>/dev/null
}

extract_metrics() {
  local mlir="$1"
  python3 - "$mlir" <<'PYEOF'
import sys, re
path = sys.argv[1]
try:
    txt = open(path).read()
except:
    print("compiled_ii=ERR  rec_mii=ERR  res_mii=ERR  dfg_nodes=ERR")
    sys.exit(0)
def g(pat): m = re.search(pat, txt); return m.group(1) if m else "?"
cii = g(r'compiled_ii\s*=\s*(\d+)')
rec = g(r'rec_mii\s*=\s*(\d+)')
res = g(r'res_mii\s*=\s*(\d+)')
lines = txt.split('\n')
depth, in_fused, fused_depth, nodes = 0, False, 0, 0
for line in lines:
    opens  = line.count('{')
    closes = line.count('}')
    stripped = line.strip()
    if in_fused:
        fused_depth += opens - closes
        if fused_depth <= 0: in_fused = False
        depth += opens - closes
        if depth < 0: depth = 0
        continue
    if depth == 2 and stripped and not stripped.startswith('//'):
        if re.search(r'neura\.fused_op', stripped):
            nodes += 1; in_fused = True; fused_depth = opens - closes
        elif re.search(r'neura\.data_mov|neura\.yield|neura\.return', stripped):
            pass
        elif re.search(r'neura\.\w', stripped):
            nodes += 1
    depth += opens - closes
    if depth < 0: depth = 0
print(f"compiled_ii={cii}  rec_mii={rec}  res_mii={res}  dfg_nodes={nodes}")
PYEOF
}

exec > >(tee "$LOG") 2>&1
echo "=== Baseline new kernels uf=1/2/4 ==="
echo "date: $(date)"
echo ""

CFLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"

echo "### GEMM_V2 (2-loop merged i*k, NI=NJ=NK=64, pragma on j-loop)"
for uf in 1 2 4; do
  base="/tmp/bl_gemmv2_uf${uf}"
  compile_to_mlir "$E2E/gemm/kernel_pragma_uf${uf}_v2.c" "$CFLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "gemm_v2 uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "gemm_v2 uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "gemm_v2 uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "### DTW (squared distance, SIZE=512, pragma on x-loop)"
for uf in 1 2 4; do
  base="/tmp/bl_dtw_uf${uf}"
  compile_to_mlir "$E2E/dtw/dtw_standalone_uf${uf}.c" "$CFLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "dtw uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "dtw uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "dtw  uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "### MVT (N=256, pragma on inner i-loop)"
for uf in 1 2 4; do
  base="/tmp/bl_mvt_uf${uf}"
  compile_to_mlir "$E2E/mvt/mvt_standalone_uf${uf}.c" "$CFLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "mvt uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "mvt uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "mvt  uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "### CONV (1D, N=1024, K=7, pragma on inner k-loop)"
for uf in 1 2 4; do
  base="/tmp/bl_conv_uf${uf}"
  compile_to_mlir "$E2E/conv/conv_standalone_uf${uf}.c" "$CFLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "conv uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "conv uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "conv uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "### LATNRM (layer norm, N=512, D=64, pragma on inner j-loops)"
for uf in 1 2 4; do
  base="/tmp/bl_latnrm_uf${uf}"
  compile_to_mlir "$E2E/latnrm/latnrm_standalone_uf${uf}.c" "$CFLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "latnrm uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "latnrm uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "latnrm uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "=== done ==="
