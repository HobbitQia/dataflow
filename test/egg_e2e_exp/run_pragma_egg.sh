#!/usr/bin/env bash
# Run egg-process-neura mapping for fft, fir, gemm, gemv, histogram, relu, spmv
# uf=1/2/4 for each kernel
# Pipeline adds --egg-process-neura after --transform-ctrl-to-data-flow/fold-constant

set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
ARCH=/mnt/public/qjj/dataflow/test/egg_e2e_exp/architecture_all_tiles_mem.yaml
PPA_SPEC=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
LOG=$E2E/pragma_egg_results.log

# -------------------------------------------------------
compile_to_mlir() {
  local src="$1" flags="$2" out_mlir="$3" func_re="${4:-.*kernel.*}"
  local base="${out_mlir%.mlir}"
  clang-12 -S -emit-llvm $flags -o "${base}_full.ll" "$src"
  llvm-extract -S --rfunc="$func_re" "${base}_full.ll" -o "${base}.ll"
  mlir-translate --import-llvm "${base}.ll" -o "$out_mlir"
}

run_mapping_egg() {
  local in_mlir="$1" out_mlir="$2"
  # pushd /tmp so egg tmp files (tmp-generated-dfg.yaml etc.) land in /tmp
  pushd /tmp > /dev/null
  $NEURA_OPT \
    --architecture-spec="$ARCH" \
    --area-spec="$PPA_SPEC" \
    --assign-accelerator \
    --lower-llvm-to-neura \
    --promote-input-arg-to-const \
    --fold-constant \
    --canonicalize-return \
    --canonicalize-live-in \
    --leverage-predicated-value \
    --transform-ctrl-to-data-flow \
    --fold-constant \
    "--egg-process-neura=max-pattern-area=50000 max-pattern-ops=20" \
    --insert-data-mov \
    "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" >/dev/null 2>/dev/null
  local ret=$?
  popd > /dev/null
  return $ret
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
# - neura.fused_op counts as 1 node; ops inside its region are excluded
# - skip data_mov / yield / return
lines = txt.split('\n')
depth = 0
in_fused = False
fused_depth = 0
nodes = 0
for line in lines:
    opens  = line.count('{')
    closes = line.count('}')
    stripped = line.strip()

    if in_fused:
        fused_depth += opens - closes
        if fused_depth <= 0:
            in_fused = False
        depth += opens - closes
        if depth < 0: depth = 0
        continue

    if depth == 2 and stripped and not stripped.startswith('//'):
        if re.search(r'neura\.fused_op', stripped):
            nodes += 1
            in_fused = True
            fused_depth = opens - closes
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
echo "=== Pragma-unroll + egg-process-neura results ==="
echo "date: $(date)"
echo ""

# -------------------------------------------------------
# FFT: standalone C, single butterfly stage, BPGROUP=128
FFT_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
FFT_SRC=($E2E/fft/fft_standalone_uf1.c $E2E/fft/fft_standalone_uf2.c $E2E/fft/fft_standalone_uf4.c)

echo "### FFT (standalone, BPGROUP=128, integer, pragma on k-loop)"
for uf in 1 2 4; do
  src="${FFT_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_fft_sa_uf${uf}"
  compile_to_mlir "$src" "$FFT_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "fft uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "fft uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "fft  uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# FIR: standalone C++, 32 taps, pragma on single loop
FIR_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
FIR_SRC=($E2E/fir/kernel_pragma_uf1.cpp $E2E/fir/kernel_pragma_uf2.cpp $E2E/fir/kernel_pragma_uf4.cpp)

echo "### FIR (NTAPS=32, integer, pragma on single loop)"
for uf in 1 2 4; do
  src="${FIR_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_fir_sa_uf${uf}"
  compile_to_mlir "$src" "$FIR_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "fir uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "fir uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "fir  uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# GEMM: pointer-arg standalone C, NI=NJ=NK=64, pragma on j-loop
GEMM_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
GEMM_SRC=($E2E/gemm/kernel_pragma_uf1.c $E2E/gemm/kernel_pragma_uf2.c $E2E/gemm/kernel_pragma_uf4.c)

echo "### GEMM (standalone, NI=NJ=NK=64, integer, pointer args, pragma on j-loop)"
for uf in 1 2 4; do
  src="${GEMM_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_gemm_sa_uf${uf}"
  compile_to_mlir "$src" "$GEMM_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "gemm uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "gemm uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "gemm uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# GEMV: standalone C++, N=512, pragma on inner j-loop
GEMV_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
GEMV_SRC=($E2E/gemv/kernel_pragma_uf1.cpp $E2E/gemv/kernel_pragma_uf2.cpp $E2E/gemv/kernel_pragma_uf4.cpp)

echo "### GEMV (N=512, integer, pragma on inner j-loop)"
for uf in 1 2 4; do
  src="${GEMV_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_gemv_sa_uf${uf}"
  compile_to_mlir "$src" "$GEMV_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "gemv uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "gemv uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "gemv uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# HISTOGRAM: standalone C++, DATA_LEN=1024, BUCKET_LEN=16
HIST_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
HIST_SRC=($E2E/histogram/kernel_pragma_uf1.cpp $E2E/histogram/kernel_pragma_uf2.cpp $E2E/histogram/kernel_pragma_uf4.cpp)

echo "### HISTOGRAM (DATA_LEN=1024, BUCKET_LEN=16, integer, pragma on loop)"
for uf in 1 2 4; do
  src="${HIST_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_hist_sa_uf${uf}"
  compile_to_mlir "$src" "$HIST_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "histogram uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "histogram uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "hist uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# RELU: standalone C, NI=NJ=64, 2D loop
RELU_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
RELU_SRC=($E2E/relu/relu_standalone_uf1.c $E2E/relu/relu_standalone_uf2.c $E2E/relu/relu_standalone_uf4.c)

echo "### RELU (standalone, NI=NJ=64, integer, 2D loop, pragma on inner j-loop)"
for uf in 1 2 4; do
  src="${RELU_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_relu_sa_uf${uf}"
  compile_to_mlir "$src" "$RELU_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "relu uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "relu uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "relu uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

# -------------------------------------------------------
# SPMV: standalone C, NNZ=1024 as macro
SPMV_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
SPMV_SRC=($E2E/spmv/spmv_standalone_uf1.c $E2E/spmv/spmv_standalone_uf2.c $E2E/spmv/spmv_standalone_uf4.c)

echo "### SPMV (standalone, NNZ=1024, integer, pragma on loop)"
for uf in 1 2 4; do
  src="${SPMV_SRC[$((uf==1?0:uf==2?1:2))]}"
  base="/tmp/egg_spmv_sa_uf${uf}"
  compile_to_mlir "$src" "$SPMV_FLAGS" "${base}_llvm.mlir" ".*kernel.*" 2>/dev/null || { echo "spmv uf=$uf: COMPILE_ERR"; continue; }
  run_mapping_egg "${base}_llvm.mlir" "${base}_mapped.mlir" || { echo "spmv uf=$uf: MAP_ERR"; continue; }
  metrics=$(extract_metrics "${base}_mapped.mlir")
  printf "spmv uf=%-2s  %s\n" "$uf" "$metrics"
done
echo ""

echo "=== done ==="
