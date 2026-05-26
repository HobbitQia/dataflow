#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
LLVM_BUILD="${LLVM_BUILD:-/mnt/public/sichuan_a/qjj/llvm-project/build}"
LLVM_OPT="${LLVM_OPT:-/mnt/public/qjj/llvm-project/build/bin/opt}"
CLANG="$LLVM_BUILD/bin/clang"
CLANGXX="$LLVM_BUILD/bin/clang++"
MLIR_TRANSLATE="$LLVM_BUILD/bin/mlir-translate"
NEURA_OPT="$ROOT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$ROOT_DIR/test/arch_spec/architecture.yaml"
OUT_ROOT="${OUT_ROOT:-$ROOT_DIR/test/e2e/unfused_neura_exclusive_outputs}"

mkdir -p "$OUT_ROOT"

run_kernel() {
  local name="$1"
  local compiler="$2"
  local std_flag="$3"
  local source="$4"
  local extra_flags="${5:-}"
  local map_opts="${6:-mapping-strategy=heuristic}"
  local opt_flags="${7:--O3 -fno-vectorize -fno-unroll-loops}"
  local out_dir="$OUT_ROOT/$name"

  mkdir -p "$out_dir"
  {
    printf 'kernel: %s\n' "$name"
    printf 'source: %s\n' "$source"
    printf 'compiler: %s\n' "$compiler"
    printf 'opt_flags: %s\n' "$opt_flags"
    printf 'map_opts: %s\n' "$map_opts"
  } >"$out_dir/run.meta"

  # shellcheck disable=SC2086
  "$compiler" -S -emit-llvm $opt_flags $std_flag \
    $extra_flags -o "$out_dir/kernel-full.ll" "$source" \
    >"$out_dir/clang.stdout.log" 2>"$out_dir/clang.stderr.log"

  local kernels
  kernels="$(sed -n 's/^define .*@\([^ (]*kernel[^ (]*\)(.*/\1/p' \
    "$out_dir/kernel-full.ll" | paste -sd, -)"
  if [[ -z "$kernels" ]]; then
    printf 'No function matching .*kernel.* found in %s\n' "$source" \
      >"$out_dir/error.log"
    return 1
  fi
  printf 'kernels: %s\n' "$kernels" >>"$out_dir/run.meta"

  "$LLVM_OPT" -S --passes=internalize,globaldce \
    --internalize-public-api-list="$kernels" \
    "$out_dir/kernel-full.ll" -o "$out_dir/kernel-only.ll" \
    >"$out_dir/extract.stdout.log" 2>"$out_dir/extract.stderr.log"

  "$MLIR_TRANSLATE" --import-llvm "$out_dir/kernel-only.ll" \
    -o "$out_dir/kernel.mlir" \
    >"$out_dir/mlir-translate.stdout.log" \
    2>"$out_dir/mlir-translate.stderr.log"

  (
    cd "$out_dir"
    "$NEURA_OPT" kernel.mlir \
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
      --map-to-accelerator="$map_opts" \
      --architecture-spec="$ARCH_SPEC" \
      --generate-code -o mapping.mlir \
      >opt.stdout.log 2>opt.stderr.log

    mv tmp-generated-instructions.yaml instructions.yaml
    mv tmp-generated-instructions.asm instructions.asm
    mv tmp-generated-dfg.yaml dfg.yaml
    mv tmp-generated-dfg.dot dfg.dot
  )
}

CGRA="$ROOT_DIR/test/benchmark/CGRA-Bench/kernels"

run_kernel axpy "$CLANGXX" "-std=c++17" \
  "$ROOT_DIR/test/benchmark/axpy/axpy_int.cpp"

run_kernel bicg "$CLANG" "-std=c11" \
  "$CGRA/bicg/bicg.c" \
  "-I $CGRA/bicg -DSMALL_DATASET"

run_kernel bicg_int "$CLANG" "-std=c11" \
  "$CGRA/bicg/bicg_int.c" \
  "-I $CGRA/bicg -DSMALL_DATASET"

run_kernel fft "$CLANG" "-std=c11" \
  "$CGRA/fft/fft_int.c"

run_kernel fir "$CLANGXX" "" \
  "$CGRA/fir/fir_int.cpp"

run_kernel fir_vec "$CLANGXX" "" \
  "$CGRA/fir/fir_int.cpp" \
  "" \
  "mapping-strategy=heuristic" \
  "-O3 -fno-unroll-loops"

run_kernel gemm "$CLANG" "-std=c11" \
  "$CGRA/gemm/gemm_int.c"

run_kernel gemv "$CLANGXX" "-std=c++17" \
  "$ROOT_DIR/test/benchmark/gemv/gemv_int.cpp"

run_kernel histogram "$CLANGXX" "" \
  "$CGRA/histogram/histogram_int.cpp" \
  "" \
  "mapping-strategy=heuristic backtrack-config=customized"

run_kernel relu "$CLANGXX" "-std=c++17" \
  "$CGRA/relu/relu_int.cpp"

run_kernel spmv "$CLANG" "-std=c11" \
  "$CGRA/spmv/spmv.c"

{
  printf 'kernel,status,instructions_bytes,compiled_ii\n'
  for dir in "$OUT_ROOT"/*; do
    [[ -d "$dir" && -f "$dir/run.meta" ]] || continue
    name="$(basename "$dir")"
    [[ "$name" == _* ]] && continue
    if [[ -f "$dir/instructions.yaml" ]]; then
      bytes="$(wc -c <"$dir/instructions.yaml")"
      ii="$(sed -n 's/^  compiled_ii: //p' "$dir/instructions.yaml" | head -n 1)"
      printf '%s,ok,%s,%s\n' "$name" "$bytes" "$ii"
    else
      printf '%s,failed,0,\n' "$name"
    fi
  done
} >"$OUT_ROOT/summary.csv"

printf 'Wrote outputs under %s\n' "$OUT_ROOT"
