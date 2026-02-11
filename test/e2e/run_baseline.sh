#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
BUILD_DIR="$WORKSPACE_ROOT/build"
NEURA_OPT="$BUILD_DIR/tools/mlir-neura-opt/mlir-neura-opt"
BENCHMARK_DIR="$WORKSPACE_ROOT/test/benchmark"
ARCH_SPEC="$SCRIPT_DIR/architecture_edge_mem.yaml"
LOG_FILE="$SCRIPT_DIR/baseline_results.log"
TIMEOUT=600

UNROLL_FACTORS=(${UNROLL_FACTORS:-1 2 4})

declare -A KERNEL_SRC KERNEL_FLAGS KERNEL_EXT
KERNEL_SRC[axpy]="$BENCHMARK_DIR/axpy/axpy_int.cpp";           KERNEL_FLAGS[axpy]="-O3 -fno-vectorize -fno-unroll-loops -std=c++17"; KERNEL_EXT[axpy]="cpp"
KERNEL_SRC[bicg]="$SCRIPT_DIR/bicg/bicg.c";                    KERNEL_FLAGS[bicg]="-O3 -fno-vectorize -fno-unroll-loops -std=c11 -I$BENCHMARK_DIR/CGRA-Bench/kernels/bicg -DSMALL_DATASET"; KERNEL_EXT[bicg]="c"
KERNEL_SRC[fft]="$BENCHMARK_DIR/CGRA-Bench/kernels/fft/fft_int.c"; KERNEL_FLAGS[fft]="-O3 -fno-vectorize -fno-unroll-loops -std=c11"; KERNEL_EXT[fft]="c"
KERNEL_SRC[fir]="$SCRIPT_DIR/fir/fir_int.cpp";                 KERNEL_FLAGS[fir]="-O3 -fno-vectorize -fno-unroll-loops"; KERNEL_EXT[fir]="cpp"
KERNEL_SRC[gemm]="$SCRIPT_DIR/gemm/gemm.c";                    KERNEL_FLAGS[gemm]="-O3 -fno-vectorize -fno-unroll-loops -std=c11"; KERNEL_EXT[gemm]="c"
KERNEL_SRC[gemv]="$BENCHMARK_DIR/gemv/gemv_int.cpp";           KERNEL_FLAGS[gemv]="-O3 -fno-vectorize -fno-unroll-loops -std=c++17"; KERNEL_EXT[gemv]="cpp"
KERNEL_SRC[histogram]="$SCRIPT_DIR/histogram/histogram_int.cpp"; KERNEL_FLAGS[histogram]="-O3 -fno-vectorize -fno-unroll-loops"; KERNEL_EXT[histogram]="cpp"
KERNEL_SRC[relu]="$SCRIPT_DIR/relu/relu.c";                    KERNEL_FLAGS[relu]="-O3 -fno-vectorize -fno-unroll-loops -std=c11 -I$SCRIPT_DIR/relu -DSMALL_DATASET"; KERNEL_EXT[relu]="c"
KERNEL_SRC[spmv]="$SCRIPT_DIR/spmv/spmv.c";                   KERNEL_FLAGS[spmv]="-O3 -fno-vectorize -fno-unroll-loops -std=c11"; KERNEL_EXT[spmv]="c"

KERNELS=(axpy bicg fft fir gemm gemv histogram relu spmv)

get_source() {
    local kernel=$1 factor=$2 kernel_dir=$3
    if [ "$factor" -eq 1 ]; then
        echo "${KERNEL_SRC[$kernel]}"
    else
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
    local ll_full="$kernel_dir/kernel-full-uf${factor}.ll"
    local ll_only="$kernel_dir/kernel-only-uf${factor}.ll"
    local mlir_out="$kernel_dir/kernel-uf${factor}.mlir"
    clang-12 -S -emit-llvm $flags -o "$ll_full" "$src" 2>/dev/null || return 1
    llvm-extract -S --rfunc=".*kernel.*" "$ll_full" -o "$ll_only" 2>/dev/null || return 1
    mlir-translate --import-llvm "$ll_only" -o "$mlir_out" 2>/dev/null || return 1
    echo "$mlir_out"
}

run_mapping() {
    local input=$1 output=$2 log=$3 kernel_dir=$4
    pushd "$kernel_dir" > /dev/null
    rm -f tmp-generated-dfg.yaml tmp-generated-dfg.dot tmp-generated-instructions.yaml tmp-generated-instructions.asm tmp-memory-access.yaml
    timeout $TIMEOUT "$NEURA_OPT" "$input" \
        --architecture-spec="$ARCH_SPEC" \
        --assign-accelerator --lower-llvm-to-neura --promote-input-arg-to-const \
        --fold-constant --canonicalize-return --canonicalize-live-in \
        --leverage-predicated-value --transform-ctrl-to-data-flow --fold-constant \
        --insert-data-mov --map-to-accelerator="mapping-strategy=heuristic" \
        --generate-code -o "$output" >"$log" 2>&1 || true
    popd > /dev/null
}

extract_metrics() {
    local output=$1 log=$2 kernel_dir=$3
    compiled_ii=$(grep -oP 'compiled_ii = \K\d+' "$output" 2>/dev/null | head -1)
    rec_mii=$(grep -oP 'rec_mii = \K\d+' "$output" 2>/dev/null | head -1)
    res_mii=$(grep -oP 'res_mii = \K\d+' "$output" 2>/dev/null | head -1)
    [ -z "$rec_mii" ] && rec_mii=$(grep -oP 'Calculated Recurrence MII: \K\d+' "$log" 2>/dev/null | head -1)
    if [ -z "$res_mii" ]; then
        local total_ops=$(grep -oP '\[calculateResMii\] Total operations: \K\d+' "$log" 2>/dev/null | head -1)
        [ -n "$total_ops" ] && res_mii=$(( (total_ops + 15) / 16 ))
    fi
    local dfg_yaml="$kernel_dir/tmp-generated-dfg.yaml"
    if [ -f "$dfg_yaml" ]; then
        dfg_nodes=$(grep -c "^  - id:" "$dfg_yaml" 2>/dev/null || echo "")
    else
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
    elif grep -q "Stack dump\|Segmentation" "$log" 2>/dev/null; then
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
        echo "Date: $(date)"
        echo ""
        printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "kernel" "compiled_ii" "rec_mii" "res_mii" "dfg_nodes" "status"
        printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "------" "-----------" "-------" "-------" "---------" "------"
    } >> "$LOG_FILE"

    for kernel in "${KERNELS[@]}"; do
        KERNEL_DIR="$SCRIPT_DIR/$kernel"
        OUTPUT="$KERNEL_DIR/kernel-mapped-uf${factor}.mlir"
        ALL_LOG="$KERNEL_DIR/baseline_uf${factor}.log"
        compiled_ii="N/A"; rec_mii="N/A"; res_mii="N/A"; dfg_nodes="N/A"; status="ERROR"

        mlir_path=$(compile_kernel "$kernel" "$factor" "$KERNEL_DIR" 2>/dev/null)
        if [ -z "$mlir_path" ] || [ ! -f "$mlir_path" ]; then
            if [ -f "$KERNEL_DIR/kernel.mlir" ] && [ "$factor" -eq 1 ]; then
                mlir_path="$KERNEL_DIR/kernel.mlir"
            else
                printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "$kernel" "N/A" "N/A" "N/A" "N/A" "COMPILE_FAIL" >> "$LOG_FILE"
                continue
            fi
        fi

        run_mapping "$mlir_path" "$OUTPUT" "$ALL_LOG" "$KERNEL_DIR"
        extract_metrics "$OUTPUT" "$ALL_LOG" "$KERNEL_DIR"
        printf "%-12s %-14s %-10s %-10s %-12s %-8s\n" "$kernel" "$compiled_ii" "$rec_mii" "$res_mii" "$dfg_nodes" "$status" >> "$LOG_FILE"
    done
    echo "" >> "$LOG_FILE"
done

echo "========== Done ==========" >> "$LOG_FILE"
cat "$LOG_FILE"
