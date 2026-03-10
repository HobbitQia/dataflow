#!/bin/bash
# Run egg-based mapping with large loop bounds (axpy kN=1024, fir NTAPS=1024,
# gemv N=512, histogram DATA_LEN=1024, relu/bicg LARGE_DATASET) so that unrolling
# does NOT change the loop exit condition structure.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
BUILD_DIR="$WORKSPACE_ROOT/build"
NEURA_OPT="$BUILD_DIR/tools/mlir-neura-opt/mlir-neura-opt"
BENCHMARK_DIR="$WORKSPACE_ROOT/test/benchmark"
ARCH_SPEC="$SCRIPT_DIR/architecture_all_tiles_mem.yaml"
PPA_SPEC="$SCRIPT_DIR/../../test/egg/ppa_spec.yaml"
LOG_FILE="$SCRIPT_DIR/egg_large_results.log"
TIMEOUT=600

UNROLL_FACTORS=(1 2 4)

declare -A KERNEL_SRC KERNEL_FLAGS KERNEL_EXT KERNEL_UF2_SRC KERNEL_UF4_SRC

# axpy: large bounds via dedicated source file (kN=1024)
KERNEL_SRC[axpy]="$SCRIPT_DIR/axpy/axpy_large.cpp"
KERNEL_UF2_SRC[axpy]="$SCRIPT_DIR/axpy/kernel_uf2_large.cpp"
KERNEL_UF4_SRC[axpy]="$SCRIPT_DIR/axpy/kernel_uf4_large.cpp"
KERNEL_FLAGS[axpy]="-O3 -fno-vectorize -fno-unroll-loops -std=c++17"
KERNEL_EXT[axpy]="cpp"

# bicg: use LARGE_DATASET (M=1900, N=2100) instead of SMALL_DATASET
KERNEL_SRC[bicg]="$SCRIPT_DIR/bicg/bicg.c"
KERNEL_FLAGS[bicg]="-O3 -fno-vectorize -fno-unroll-loops -std=c11 -I$BENCHMARK_DIR/CGRA-Bench/kernels/bicg -DLARGE_DATASET"
KERNEL_EXT[bicg]="c"

# fft: NSTAGES=8, NPOINTS=256 — already large enough
KERNEL_SRC[fft]="$BENCHMARK_DIR/CGRA-Bench/kernels/fft/fft_int.c"
KERNEL_FLAGS[fft]="-O3 -fno-vectorize -fno-unroll-loops -std=c11"
KERNEL_EXT[fft]="c"

# fir: override NTAPS=1024 via -D flag (kernel_uf? files also use #define NTAPS)
KERNEL_SRC[fir]="$SCRIPT_DIR/fir/fir_int.cpp"
KERNEL_FLAGS[fir]="-O3 -fno-vectorize -fno-unroll-loops -DNTAPS=1024"
KERNEL_EXT[fir]="cpp"

# gemm: already defaults to LARGE_DATASET (NI=1000, NJ=1100, NK=1200)
KERNEL_SRC[gemm]="$SCRIPT_DIR/gemm/gemm.c"
KERNEL_FLAGS[gemm]="-O3 -fno-vectorize -fno-unroll-loops -std=c11"
KERNEL_EXT[gemm]="c"

# gemv: large bounds via dedicated source file (N=512)
KERNEL_SRC[gemv]="$SCRIPT_DIR/gemv/gemv_large.cpp"
KERNEL_UF2_SRC[gemv]="$SCRIPT_DIR/gemv/kernel_uf2_large.cpp"
KERNEL_UF4_SRC[gemv]="$SCRIPT_DIR/gemv/kernel_uf4_large.cpp"
KERNEL_FLAGS[gemv]="-O3 -fno-vectorize -fno-unroll-loops -std=c++17"
KERNEL_EXT[gemv]="cpp"

# histogram: override DATA_LEN=1024 via -D flag
KERNEL_SRC[histogram]="$SCRIPT_DIR/histogram/histogram_int.cpp"
KERNEL_FLAGS[histogram]="-O3 -fno-vectorize -fno-unroll-loops -DDATA_LEN=1024 -DBUCKET_LEN=5 -DMIN=1 -DMAX=1023"
KERNEL_EXT[histogram]="cpp"

# relu: use LARGE_DATASET instead of SMALL_DATASET
KERNEL_SRC[relu]="$SCRIPT_DIR/relu/relu.c"
KERNEL_FLAGS[relu]="-O3 -fno-vectorize -fno-unroll-loops -std=c11 -I$SCRIPT_DIR/relu -DLARGE_DATASET"
KERNEL_EXT[relu]="c"

# spmv: nnz is a runtime variable, not constant-folded; OK as-is
KERNEL_SRC[spmv]="$SCRIPT_DIR/spmv/spmv.c"
KERNEL_FLAGS[spmv]="-O3 -fno-vectorize -fno-unroll-loops -std=c11"
KERNEL_EXT[spmv]="c"

KERNELS=(axpy bicg fft fir gemm gemv histogram relu spmv)

get_source() {
    local kernel=$1 factor=$2 kernel_dir=$3
    if [ "$factor" -eq 1 ]; then
        echo "${KERNEL_SRC[$kernel]}"
    elif [ "$factor" -eq 2 ] && [ -n "${KERNEL_UF2_SRC[$kernel]}" ]; then
        echo "${KERNEL_UF2_SRC[$kernel]}"
    elif [ "$factor" -eq 4 ] && [ -n "${KERNEL_UF4_SRC[$kernel]}" ]; then
        echo "${KERNEL_UF4_SRC[$kernel]}"
    else
        # Fallback: check for kernel_uf<factor>.<ext> in kernel_dir (uses -D flags)
        local ext="${KERNEL_EXT[$kernel]}"
        local uf_src="$kernel_dir/kernel_uf${factor}.${ext}"
        if [ -f "$uf_src" ]; then
            echo "$uf_src"
        else
            echo "${KERNEL_SRC[$kernel]}"
        fi
    fi
}

compile_kernel() {
    local kernel=$1 factor=$2 kernel_dir=$3
    local src=$(get_source "$kernel" "$factor" "$kernel_dir")
    local flags="${KERNEL_FLAGS[$kernel]}"
    local ll_full="$kernel_dir/kernel-large-full-uf${factor}.ll"
    local ll_only="$kernel_dir/kernel-large-only-uf${factor}.ll"
    local mlir_out="$kernel_dir/kernel-large-uf${factor}.mlir"
    clang-12 -S -emit-llvm $flags -o "$ll_full" "$src" 2>/dev/null || return 1
    llvm-extract -S --rfunc=".*kernel.*" "$ll_full" -o "$ll_only" 2>/dev/null || return 1
    mlir-translate --import-llvm "$ll_only" -o "$mlir_out" 2>/dev/null || return 1
    echo "$mlir_out"
}

run_mapping_egg() {
    local input=$1 output=$2 log=$3 kernel_dir=$4
    pushd "$kernel_dir" > /dev/null
    rm -f tmp-generated-dfg.yaml tmp-generated-dfg.dot tmp-generated-instructions.yaml tmp-generated-instructions.asm tmp-memory-access.yaml
    timeout $TIMEOUT "$NEURA_OPT" "$input" \
        --architecture-spec="$ARCH_SPEC" \
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
        --egg-process-neura="max-pattern-area=50000 max-pattern-ops=20" \
        --insert-data-mov \
        --map-to-accelerator="mapping-strategy=heuristic" \
        -o "$output" >"$log" 2>&1 || true
    popd > /dev/null
}

extract_metrics() {
    local output=$1 log=$2 kernel_dir=$3
    compiled_ii=$(grep -oP 'compiled_ii = \K\d+' "$output" 2>/dev/null | head -1)
    rec_mii=$(grep -oP 'rec_mii = \K\d+' "$output" 2>/dev/null | head -1)
    res_mii=$(grep -oP 'res_mii = \K\d+' "$output" 2>/dev/null | head -1)
    [ -z "$rec_mii" ] && rec_mii=$(grep -oP 'Calculated Recurrence MII: \K\d+' "$log" 2>/dev/null | head -1)
    [ -z "$rec_mii" ] && rec_mii=$(grep -oP 'rec_mii = \K\d+' "$log" 2>/dev/null | head -1)
    [ -z "$res_mii" ] && res_mii=$(grep -oP 'res_mii = \K\d+' "$log" 2>/dev/null | head -1)
    [ -z "$compiled_ii" ] && compiled_ii=$(grep -oP 'compiled_ii = \K\d+' "$log" 2>/dev/null | head -1)
    if [ -z "$res_mii" ]; then
        local total_ops=$(grep -oP '\[calculateResMii\] Total operations: \K\d+' "$log" 2>/dev/null | head -1)
        [ -n "$total_ops" ] && res_mii=$(( (total_ops + 15) / 16 ))
    fi
    # Count dfg_nodes from output MLIR: top-level ops only.
    # fused_op counts as 1 node; its region internals are excluded.
    # data_mov and yield are excluded (non-materialized).
    if [ -f "$output" ]; then
        dfg_nodes=$(python3 -c "
import sys
in_fused, depth, fused, regular = False, 0, 0, 0
for line in open('$output'):
    s = line.rstrip()
    if not in_fused and 'neura.fused_op' in s:
        fused += 1; in_fused = True; depth = s.count('{') - s.count('}')
        if depth <= 0: in_fused = False
        continue
    if in_fused:
        depth += s.count('{') - s.count('}')
        if depth <= 0: in_fused = False
        continue
    if 'neura.' in s and 'neura.data_mov' not in s and 'neura.yield' not in s:
        regular += 1
print(fused + regular)
" 2>/dev/null)
    fi
    if [ -z "$dfg_nodes" ] || [ "$dfg_nodes" = "0" ]; then
        dfg_nodes=$(grep -oP 'Starting mapping with \K\d+' "$log" 2>/dev/null | head -1 || true)
        [ -z "$dfg_nodes" ] && dfg_nodes=$(grep -oP '\[calculateResMii\] Total operations: \K\d+' "$log" 2>/dev/null | head -1 || true)
    fi
    [ -z "$compiled_ii" ] && compiled_ii="N/A"
    [ -z "$rec_mii" ] && rec_mii="N/A"
    [ -z "$res_mii" ] && res_mii="N/A"
    [ -z "$dfg_nodes" ] && dfg_nodes="N/A"
    if [ "$compiled_ii" != "N/A" ]; then
        status="OK"
    elif grep -q "Mapping failed" "$log" 2>/dev/null; then
        status="MAP_FAIL"
    elif grep -q "Stack dump\|Segmentation\|Aborted" "$log" 2>/dev/null; then
        status="CRASH"
    else
        status="ERROR"
    fi
}

> "$LOG_FILE"

for factor in "${UNROLL_FACTORS[@]}"; do
    {
        echo "========== Unroll Factor = $factor =========="
        echo "Architecture: $ARCH_SPEC"
        echo "PPA Spec:     $PPA_SPEC"
        echo "Loop bounds:  LARGE (axpy kN=1024, fir NTAPS=1024, gemv N=512, histogram DATA_LEN=1024, polybench LARGE_DATASET)"
        echo "Date: $(date)"
        echo ""
        printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "kernel" "compiled_ii" "rec_mii" "res_mii" "dfg_nodes" "status"
        printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "------" "-----------" "-------" "-------" "---------" "------"
    } | tee -a "$LOG_FILE"

    for kernel in "${KERNELS[@]}"; do
        KERNEL_DIR="$SCRIPT_DIR/$kernel"
        OUTPUT="$KERNEL_DIR/kernel-large-egg-uf${factor}.mlir"
        ALL_LOG="$KERNEL_DIR/egg_large_uf${factor}.log"
        compiled_ii="N/A"; rec_mii="N/A"; res_mii="N/A"; dfg_nodes="N/A"; status="ERROR"

        echo -n "  Running $kernel (uf=$factor) ... " | tee -a "$LOG_FILE"

        mlir_path=$(compile_kernel "$kernel" "$factor" "$KERNEL_DIR" 2>/dev/null)
        if [ -z "$mlir_path" ] || [ ! -f "$mlir_path" ]; then
            echo "COMPILE_FAIL" | tee -a "$LOG_FILE"
            printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "$kernel" "N/A" "N/A" "N/A" "N/A" "COMPILE_FAIL" >> "$LOG_FILE"
            continue
        fi

        run_mapping_egg "$mlir_path" "$OUTPUT" "$ALL_LOG" "$KERNEL_DIR"
        extract_metrics "$OUTPUT" "$ALL_LOG" "$KERNEL_DIR"
        echo "$status" | tee -a "$LOG_FILE"
        printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "$kernel" "$compiled_ii" "$rec_mii" "$res_mii" "$dfg_nodes" "$status" >> "$LOG_FILE"
    done
    echo "" >> "$LOG_FILE"
done

echo "========== Done ==========" >> "$LOG_FILE"
echo ""
echo "=============================="
echo "   EGG LARGE MAPPING RESULTS"
echo "=============================="
cat "$LOG_FILE"
