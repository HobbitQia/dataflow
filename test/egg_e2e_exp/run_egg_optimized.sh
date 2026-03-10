#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
PPA=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml

declare -A ARCH_MAP
ARCH_MAP[3x3]="$E2E/architecture_all_tiles_mem.yaml"
ARCH_MAP[4x4]="$E2E/architecture_all_tiles_mem_4x4.yaml"
ARCH_MAP[5x5]="$E2E/architecture_all_tiles_mem_5x5.yaml"
ARCH_MAP[4x8]="$E2E/architecture_all_tiles_mem_4x8.yaml"

CPP="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
C11="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"

compile_to_mlir() {
  local src="$1" flags="$2" out_mlir="$3" func_re="${4:-.*kernel.*}"
  local base="${out_mlir%.mlir}"
  clang-12 -S -emit-llvm $flags -o "${base}_full.ll" "$src" 2>/dev/null
  llvm-extract -S --rfunc="$func_re" "${base}_full.ll" -o "${base}.ll" 2>/dev/null
  mlir-translate --import-llvm "${base}.ll" -o "$out_mlir" 2>/dev/null
}

run_egg() {
  local in_mlir="$1" out_mlir="$2" arch="$3" max_ops="$4" max_area="$5" tout="${6:-120}"
  pushd /tmp > /dev/null
  timeout "$tout" $NEURA_OPT \
    --architecture-spec="$arch" --area-spec="$PPA" \
    --assign-accelerator --lower-llvm-to-neura --promote-input-arg-to-const \
    --fold-constant --canonicalize-return --canonicalize-live-in \
    --leverage-predicated-value --transform-ctrl-to-data-flow --fold-constant \
    "--egg-process-neura=max-pattern-area=${max_area} max-pattern-ops=${max_ops}" \
    --insert-data-mov "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" >/dev/null 2>&1
  local ret=$?
  popd > /dev/null
  return $ret
}

extract_ii() {
  local mlir="$1"
  if [ ! -s "$mlir" ]; then echo "MAP_ERR"; return; fi
  local ii rec res
  ii=$(grep -o "compiled_ii = [0-9]*" "$mlir" | head -1 | grep -o "[0-9]*$")
  rec=$(grep -o "rec_mii = [0-9]*" "$mlir" | head -1 | grep -o "[0-9]*$")
  res=$(grep -o "res_mii = [0-9]*" "$mlir" | head -1 | grep -o "[0-9]*$")
  echo "ii=${ii} rec=${rec} res=${res}"
}

LOG="$E2E/egg_optimized_results.log"
exec > >(tee "$LOG") 2>&1

echo "=== Egg optimized mapping (per-kernel best params) ==="
echo "date: $(date)"
echo ""
echo "Best params found on 3x3:"
echo "  axpy:   ops=20 area=50000 (no improvement possible, ii=rec=5)"
echo "  fir:    ops=20 area=50000 (ii=rec for uf1/2, uf4 same as baseline)"
echo "  hist:   ops=20 area=50000 (uf4: 6->5)"
echo "  gemv:   ops=20 area=10000 (rec 9->7, uf1: 10->9, uf2: 11->10, uf4: 15->11)"
echo "  latnrm: ops=3  area=10000 (uf1: 17->16, uf2: 17->16, uf4: no egg possible)"
echo "  spmv:   uf1:ops=1, uf2:ops=20, uf4:ops=20 area=50000"
echo "  gemm:   ops=2  area=50000 (rec 13->11, 16->14)"
echo ""

for size in 3x3 4x4 5x5 4x8; do
  arch="${ARCH_MAP[$size]}"
  echo "========== $size =========="

  echo "### AXPY ($size) -- ops=20, area=50000"
  for uf in 1 2 4; do
    base="/tmp/final_axpy_${size}_uf${uf}"
    compile_to_mlir "$E2E/axpy/axpy_large_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "axpy  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "axpy  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo "### FIR ($size) -- ops=20, area=50000"
  for uf in 1 2 4; do
    base="/tmp/final_fir_${size}_uf${uf}"
    compile_to_mlir "$E2E/fir/kernel_pragma_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "fir   %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "fir   %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo "### HIST ($size) -- ops=20, area=50000"
  for uf in 1 2 4; do
    base="/tmp/final_hist_${size}_uf${uf}"
    compile_to_mlir "$E2E/histogram/kernel_pragma_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "hist  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "hist  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo "### GEMV ($size) -- ops=20, area=10000"
  for uf in 1 2 4; do
    base="/tmp/final_gemv_${size}_uf${uf}"
    compile_to_mlir "$E2E/gemv/kernel_pragma_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 10000 \
      || { printf "gemv  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "gemv  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo "### LATNRM ($size) -- uf1/2: ops=3 area=10000, uf4: ops=1 area=50000 (fallback)"
  for uf in 1 2; do
    base="/tmp/final_latnrm_${size}_uf${uf}"
    compile_to_mlir "$E2E/latnrm/latnrm_standalone_uf${uf}.c" "$C11" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 3 10000 \
      || { printf "latnrm %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "latnrm %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done
  base="/tmp/final_latnrm_${size}_uf4"
  compile_to_mlir "$E2E/latnrm/latnrm_standalone_uf4.c" "$C11" "${base}_llvm.mlir"
  run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 1 50000 \
    || { printf "latnrm %s uf=4   MAP_ERR\n" "$size"; }
  if [ -s "${base}_mapped.mlir" ]; then
    printf "latnrm %s uf=4   %s\n" "$size" "$(extract_ii "${base}_mapped.mlir")"
  fi

  echo "### SPMV ($size) -- uf1: ops=1, uf2/4: ops=20, area=50000"
  base="/tmp/final_spmv_${size}_uf1"
  compile_to_mlir "$E2E/spmv/spmv_standalone_uf1.c" "$C11" "${base}_llvm.mlir"
  run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 1 50000 \
    || { printf "spmv  %s uf=1   MAP_ERR\n" "$size"; }
  if [ -s "${base}_mapped.mlir" ]; then
    printf "spmv  %s uf=1   %s\n" "$size" "$(extract_ii "${base}_mapped.mlir")"
  fi
  for uf in 2 4; do
    base="/tmp/final_spmv_${size}_uf${uf}"
    compile_to_mlir "$E2E/spmv/spmv_standalone_uf${uf}.c" "$C11" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "spmv  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "spmv  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo "### GEMM ($size) -- ops=2, area=50000"
  for uf in 1 2 4; do
    base="/tmp/final_gemm_${size}_uf${uf}"
    compile_to_mlir "$E2E/gemm/kernel_pragma_uf${uf}.c" "$C11" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 2 50000 \
      || { printf "gemm  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "gemm  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo ""
done

echo "=== done ==="
