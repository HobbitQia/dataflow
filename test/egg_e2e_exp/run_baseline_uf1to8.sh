#!/usr/bin/env bash
# Baseline (no egg) mapping for all 9 kernels, uf = 1 / 2 / 4 / 8
# Flags: -fno-vectorize -fno-slp-vectorize -fno-unroll-loops on all kernels

set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
ARCH=/mnt/public/qjj/dataflow/test/egg_e2e_exp/architecture_all_tiles_mem.yaml
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
LOG=$E2E/baseline_uf1to8_3x3_results.log

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
  --map-to-accelerator=mapping-strategy=heuristic \
  --generate-code"

# -------------------------------------------------------
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
# count dfg nodes inside neura.func body (depth==2)
# neura.fused_op counts as 1; ops inside its region excluded
# skip data_mov / yield / return
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
echo "=== Baseline (no egg) all kernels uf=1/2/4/8 ==="
echo "date: $(date)"
echo ""

# -------------------------------------------------------
# AXPY: kN=1024, pragma on loop
AXPY_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
declare -A AXPY_SRC
AXPY_SRC[1]="$E2E/axpy/axpy_large_uf1.cpp"
AXPY_SRC[2]="$E2E/axpy/axpy_large_uf2.cpp"
AXPY_SRC[4]="$E2E/axpy/axpy_large_uf4.cpp"
AXPY_SRC[8]="$E2E/axpy/axpy_large_uf8.cpp"

echo "### AXPY (kN=1024, pragma on loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_axpy_uf${uf}"
  compile_to_mlir "${AXPY_SRC[$uf]}" "$AXPY_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "axpy uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "axpy uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "axpy uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# BICG: M=N=256, pragma on innermost j-loop
BICG_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
declare -A BICG_SRC
BICG_SRC[1]="$E2E/bicg/bicg_standalone_uf1.c"
BICG_SRC[2]="$E2E/bicg/bicg_standalone_uf2.c"
BICG_SRC[4]="$E2E/bicg/bicg_standalone_uf4.c"
BICG_SRC[8]="$E2E/bicg/bicg_standalone_uf8.c"

echo "### BICG (M=N=256, pragma on innermost j-loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_bicg_uf${uf}"
  compile_to_mlir "${BICG_SRC[$uf]}" "$BICG_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "bicg uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "bicg uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "bicg uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# FFT: standalone, BPGROUP=128, pragma on k-loop
FFT_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
declare -A FFT_SRC
FFT_SRC[1]="$E2E/fft/fft_standalone_uf1.c"
FFT_SRC[2]="$E2E/fft/fft_standalone_uf2.c"
FFT_SRC[4]="$E2E/fft/fft_standalone_uf4.c"
FFT_SRC[8]="$E2E/fft/fft_standalone_uf8.c"

echo "### FFT (BPGROUP=128, pragma on k-loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_fft_uf${uf}"
  compile_to_mlir "${FFT_SRC[$uf]}" "$FFT_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "fft uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "fft uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "fft  uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# FIR: NTAPS=32, pragma on single loop
FIR_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
declare -A FIR_SRC
FIR_SRC[1]="$E2E/fir/kernel_pragma_uf1.cpp"
FIR_SRC[2]="$E2E/fir/kernel_pragma_uf2.cpp"
FIR_SRC[4]="$E2E/fir/kernel_pragma_uf4.cpp"
FIR_SRC[8]="$E2E/fir/kernel_pragma_uf8.cpp"

echo "### FIR (NTAPS=32, pragma on single loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_fir_uf${uf}"
  compile_to_mlir "${FIR_SRC[$uf]}" "$FIR_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "fir uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "fir uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "fir  uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# GEMM: pointer args, NI=NJ=NK=64, pragma on j-loop
GEMM_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
declare -A GEMM_SRC
GEMM_SRC[1]="$E2E/gemm/kernel_pragma_uf1.c"
GEMM_SRC[2]="$E2E/gemm/kernel_pragma_uf2.c"
GEMM_SRC[4]="$E2E/gemm/kernel_pragma_uf4.c"
GEMM_SRC[8]="$E2E/gemm/kernel_pragma_uf8.c"

echo "### GEMM (NI=NJ=NK=64, pointer args, pragma on j-loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_gemm_uf${uf}"
  compile_to_mlir "${GEMM_SRC[$uf]}" "$GEMM_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "gemm uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "gemm uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "gemm uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# GEMV: N=512, pragma on inner j-loop
GEMV_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
declare -A GEMV_SRC
GEMV_SRC[1]="$E2E/gemv/kernel_pragma_uf1.cpp"
GEMV_SRC[2]="$E2E/gemv/kernel_pragma_uf2.cpp"
GEMV_SRC[4]="$E2E/gemv/kernel_pragma_uf4.cpp"
GEMV_SRC[8]="$E2E/gemv/kernel_pragma_uf8.cpp"

echo "### GEMV (N=512, pragma on inner j-loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_gemv_uf${uf}"
  compile_to_mlir "${GEMV_SRC[$uf]}" "$GEMV_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "gemv uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "gemv uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "gemv uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# HISTOGRAM: DATA_LEN=1024, BUCKET_LEN=16, pragma on loop
HIST_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
declare -A HIST_SRC
HIST_SRC[1]="$E2E/histogram/kernel_pragma_uf1.cpp"
HIST_SRC[2]="$E2E/histogram/kernel_pragma_uf2.cpp"
HIST_SRC[4]="$E2E/histogram/kernel_pragma_uf4.cpp"
HIST_SRC[8]="$E2E/histogram/kernel_pragma_uf8.cpp"

echo "### HISTOGRAM (DATA_LEN=1024, BUCKET_LEN=16, pragma on loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_hist_uf${uf}"
  compile_to_mlir "${HIST_SRC[$uf]}" "$HIST_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "histogram uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "histogram uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "hist uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# RELU: standalone, NI=NJ=64, pragma on inner j-loop
RELU_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
declare -A RELU_SRC
RELU_SRC[1]="$E2E/relu/relu_standalone_uf1.c"
RELU_SRC[2]="$E2E/relu/relu_standalone_uf2.c"
RELU_SRC[4]="$E2E/relu/relu_standalone_uf4.c"
RELU_SRC[8]="$E2E/relu/relu_standalone_uf8.c"

echo "### RELU (standalone, NI=NJ=64, pragma on inner j-loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_relu_uf${uf}"
  compile_to_mlir "${RELU_SRC[$uf]}" "$RELU_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "relu uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "relu uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "relu uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# SPMV: standalone, NNZ=1024, pragma on loop
SPMV_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
declare -A SPMV_SRC
SPMV_SRC[1]="$E2E/spmv/spmv_standalone_uf1.c"
SPMV_SRC[2]="$E2E/spmv/spmv_standalone_uf2.c"
SPMV_SRC[4]="$E2E/spmv/spmv_standalone_uf4.c"
SPMV_SRC[8]="$E2E/spmv/spmv_standalone_uf8.c"

echo "### SPMV (standalone, NNZ=1024, pragma on loop)"
for uf in 1 2 4 8; do
  base="/tmp/bl_spmv_uf${uf}"
  compile_to_mlir "${SPMV_SRC[$uf]}" "$SPMV_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null \
    || { echo "spmv uf=$uf: COMPILE_ERR"; continue; }
  run_mapping "${base}_llvm.mlir" "${base}_mapped.mlir" \
    || { echo "spmv uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "spmv uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "=== done ==="
