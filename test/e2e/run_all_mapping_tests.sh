#!/bin/bash

# E2E Mapping Tests Runner
# This script runs all e2e tests with mapping and collects:
# - compiled_ii, rec_mii, res_mii
# - Memory access analysis
# - Intermediate IR (before ctrl-to-data pass)

set -e

# Directory setup
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
BUILD_DIR="$WORKSPACE_ROOT/build"
ARCH_SPEC="$SCRIPT_DIR/../arch_spec/architecture.yaml"
BENCHMARK_DIR="$SCRIPT_DIR"

# Add build directory to PATH for tools
export PATH="$BUILD_DIR/tools/mlir-neura-opt:$BUILD_DIR/tools/neura-compiler:$PATH"

# Output directories and files
RESULTS_FILE="$SCRIPT_DIR/mapping_results.csv"
MEMORY_RESULTS_DIR="$SCRIPT_DIR/memory_analysis"

# Create directories
mkdir -p "$MEMORY_RESULTS_DIR"

# Create CSV header (with memory info columns)
echo "test_name,compiled_ii,rec_mii,res_mii,total_memory_ops,memory_cycles,status" > "$RESULTS_FILE"

# Function to extract mapping info from MLIR output
extract_mapping_info() {
    local output="$1"
    local test_name="$2"
    
    # Extract compiled_ii, rec_mii, res_mii from the output
    compiled_ii=$(echo "$output" | grep -oP 'compiled_ii = \K\d+' | head -1 || echo "N/A")
    rec_mii=$(echo "$output" | grep -oP 'rec_mii = \K\d+' | head -1 || echo "N/A")
    res_mii=$(echo "$output" | grep -oP 'res_mii = \K\d+' | head -1 || echo "N/A")
    
    # Extract memory access info from output
    total_mem_ops=$(echo "$output" | grep -oP 'Memory access analysis: \K\d+' | head -1 || echo "0")
    mem_cycles=$(echo "$output" | grep -oP 'across \K\d+' | head -1 || echo "0")
    
    echo "$test_name,$compiled_ii,$rec_mii,$res_mii,$total_mem_ops,$mem_cycles"
}

# Function to run a single test
run_test() {
    local test_name="$1"
    local source_file="$2"
    local compiler="$3"
    local compiler_flags="$4"
    local extra_mapping_flags="$5"
    
    echo "========================================"
    echo "Running test: $test_name"
    echo "========================================"
    
    # Create output directory for this test
    local OUTPUT_DIR="$SCRIPT_DIR/$test_name"
    mkdir -p "$OUTPUT_DIR"
    
    # Check if source file exists
    if [ ! -f "$source_file" ]; then
        echo "ERROR: Source file not found: $source_file"
        echo "$test_name,N/A,N/A,N/A,0,0,SOURCE_NOT_FOUND" >> "$RESULTS_FILE"
        return 1
    fi
    
    # Step 1: Compile to LLVM IR using clang-12
    echo "Step 1: Compiling $source_file to LLVM IR..."
    if ! clang-12 -S -emit-llvm $compiler_flags -o "$OUTPUT_DIR/kernel-full.ll" "$source_file" 2>&1; then
        echo "ERROR: Failed to compile source file"
        echo "$test_name,N/A,N/A,N/A,0,0,COMPILE_ERROR" >> "$RESULTS_FILE"
        return 1
    fi
    
    # Step 2: Extract kernel function(s)
    echo "Step 2: Extracting kernel functions..."
    if ! llvm-extract -S --rfunc=".*kernel.*" "$OUTPUT_DIR/kernel-full.ll" -o "$OUTPUT_DIR/kernel-only.ll" 2>&1; then
        echo "ERROR: Failed to extract kernel functions"
        echo "$test_name,N/A,N/A,N/A,0,0,EXTRACT_ERROR" >> "$RESULTS_FILE"
        return 1
    fi
    
    # Step 3: Import LLVM IR to MLIR
    echo "Step 3: Importing LLVM IR to MLIR..."
    if ! mlir-translate --import-llvm "$OUTPUT_DIR/kernel-only.ll" -o "$OUTPUT_DIR/kernel.mlir" 2>&1; then
        echo "ERROR: Failed to import LLVM IR to MLIR"
        echo "$test_name,N/A,N/A,N/A,0,0,TRANSLATE_ERROR" >> "$RESULTS_FILE"
        return 1
    fi
    
    # Step 4a: Run passes BEFORE ctrl-to-data-flow (save intermediate IR)
    echo "Step 4a: Running passes before ctrl-to-data-flow..."
    mlir-neura-opt "$OUTPUT_DIR/kernel.mlir" \
        --assign-accelerator \
        --lower-llvm-to-neura \
        --promote-func-arg-to-const \
        --fold-constant \
        --canonicalize-return \
        --canonicalize-live-in \
        --leverage-predicated-value \
        -o "$OUTPUT_DIR/kernel-before-ctrl2data.mlir" 2>&1 || true
    echo "  -> Saved: $OUTPUT_DIR/kernel-before-ctrl2data.mlir"
    
    # Step 4b: Run full pipeline with mapping and code generation
    echo "Step 4b: Running full Neura pipeline with mapping..."
    pushd "$OUTPUT_DIR" > /dev/null
    output=$(mlir-neura-opt kernel.mlir \
        --assign-accelerator \
        --lower-llvm-to-neura \
        --promote-func-arg-to-const \
        --fold-constant \
        --canonicalize-return \
        --canonicalize-live-in \
        --leverage-predicated-value \
        --transform-ctrl-to-data-flow \
        --fold-constant \
        --insert-data-mov \
        --map-to-accelerator="mapping-strategy=heuristic $extra_mapping_flags" \
        --architecture-spec="$ARCH_SPEC" \
        --generate-code \
        -o "$OUTPUT_DIR/kernel-mapped.mlir" 2>&1) || true
    popd > /dev/null
    
    # Extract and print results
    result=$(extract_mapping_info "$output" "$test_name")
    echo ""
    echo "Result: $result"
    
    # Check if mapping was successful
    if echo "$output" | grep -q "compiled_ii ="; then
        echo "$result,SUCCESS" >> "$RESULTS_FILE"
        
        # Save memory access analysis file
        if [ -f "$OUTPUT_DIR/tmp-memory-access.yaml" ]; then
            cp "$OUTPUT_DIR/tmp-memory-access.yaml" "$MEMORY_RESULTS_DIR/${test_name}_memory_access.yaml"
            echo "  -> Memory access analysis: $MEMORY_RESULTS_DIR/${test_name}_memory_access.yaml"
            
            # Print memory access summary
            echo ""
            echo "=== Memory Access Summary for $test_name ==="
            head -25 "$OUTPUT_DIR/tmp-memory-access.yaml"
            echo "..."
        fi
        
        # Save generated instruction files
        if [ -f "$OUTPUT_DIR/tmp-generated-instructions.yaml" ]; then
            cp "$OUTPUT_DIR/tmp-generated-instructions.yaml" "$MEMORY_RESULTS_DIR/${test_name}_instructions.yaml"
            echo "  -> Instructions: $MEMORY_RESULTS_DIR/${test_name}_instructions.yaml"
        fi
        
        # Save DFG files
        if [ -f "$OUTPUT_DIR/tmp-generated-dfg.yaml" ]; then
            cp "$OUTPUT_DIR/tmp-generated-dfg.yaml" "$OUTPUT_DIR/${test_name}_dfg.yaml"
        fi
        if [ -f "$OUTPUT_DIR/tmp-generated-dfg.dot" ]; then
            cp "$OUTPUT_DIR/tmp-generated-dfg.dot" "$OUTPUT_DIR/${test_name}_dfg.dot"
        fi
        
        echo ""
        echo "Saved files in $OUTPUT_DIR/:"
        echo "  - kernel-full.ll          : Full LLVM IR"
        echo "  - kernel-only.ll          : Extracted kernel LLVM IR"
        echo "  - kernel.mlir             : Original MLIR"
        echo "  - kernel-before-ctrl2data.mlir : IR before ctrl-to-data-flow pass"
        echo "  - kernel-mapped.mlir      : Final mapped IR"
    else
        echo "$test_name,N/A,N/A,N/A,0,0,MAPPING_ERROR" >> "$RESULTS_FILE"
        echo "Mapping output (last 50 lines):"
        echo "$output" | tail -50
    fi
    
    echo ""
}

# Main execution
echo "Starting E2E Mapping Tests"
echo "=========================="
echo "Results will be saved to: $RESULTS_FILE"
echo "Memory analysis will be saved to: $MEMORY_RESULTS_DIR/"
echo ""

# Test 1: BICG
run_test "bicg" \
    "$BENCHMARK_DIR/bicg/bicg.c" \
    "clang-12" \
    "-O3 -fno-vectorize -fno-unroll-loops -std=c11 -I$BENCHMARK_DIR/CGRA-Bench/kernels/bicg -DSMALL_DATASET" \
    ""

# # Test 2: FIR (no vectorization)
# run_test "fir" \
#     "$BENCHMARK_DIR/CGRA-Bench/kernels/fir/fir_int.cpp" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops" \
#     ""

# # Test 3: FIR (vectorized)
# run_test "fir_vec" \
#     "$BENCHMARK_DIR/CGRA-Bench/kernels/fir/fir_int.cpp" \
#     "clang-12" \
#     "-O3 -fno-unroll-loops" \
#     ""

# # Test 4: Histogram
# run_test "histogram" \
#     "$BENCHMARK_DIR/CGRA-Bench/kernels/histogram/histogram_int.cpp" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops" \
#     "backtrack-config=customized"

# # Test 5: ReLU
# run_test "relu" \
#     "$BENCHMARK_DIR/CGRA-Bench/kernels/relu/relu.c" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops -std=c11 -I$BENCHMARK_DIR/CGRA-Bench/kernels/relu -DSMALL_DATASET" \
#     ""

# # Test 6: AXPY
# run_test "axpy" \
#     "$BENCHMARK_DIR/axpy/axpy_int.cpp" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops -std=c++17" \
#     ""

# # Test 7: GEMM
# run_test "gemm" \
#     "$BENCHMARK_DIR/CGRA-Bench/kernels/gemm/gemm.c" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops -std=c11" \
#     ""

# # Test 8: GEMV
# run_test "gemv" \
#     "$BENCHMARK_DIR/gemv/gemv_int.cpp" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops -std=c++17" \
#     ""

# # Test 9: SPMV
# run_test "spmv" \
#     "$BENCHMARK_DIR/CGRA-Bench/kernels/spmv/spmv.c" \
#     "clang-12" \
#     "-O3 -fno-vectorize -fno-unroll-loops -std=c11" \
#     ""

echo ""
echo "=========================="
echo "All tests completed!"
echo ""
echo "Summary of Mapping Results:"
echo "==========================="
echo "-----------------------------------------------------------------------------------------------------------"
printf "%-12s %-12s %-10s %-10s %-16s %-14s %-12s\n" "test_name" "compiled_ii" "rec_mii" "res_mii" "total_mem_ops" "memory_cycles" "status"
echo "-----------------------------------------------------------------------------------------------------------"
tail -n +2 "$RESULTS_FILE" | while IFS=',' read -r name ii rec res mem cycles status; do
    printf "%-12s %-12s %-10s %-10s %-16s %-14s %-12s\n" "$name" "$ii" "$rec" "$res" "$mem" "$cycles" "$status"
done
echo "-----------------------------------------------------------------------------------------------------------"
echo ""
echo "Results saved to: $RESULTS_FILE"
echo "Memory analysis files saved to: $MEMORY_RESULTS_DIR/"
echo ""
echo "=== Memory Access Summary Across All Kernels ==="
for yaml_file in "$MEMORY_RESULTS_DIR"/*_memory_access.yaml; do
    if [ -f "$yaml_file" ]; then
        kernel_name=$(basename "$yaml_file" "_memory_access.yaml")
        echo ""
        echo "--- $kernel_name ---"
        # Print compiled_ii and summary
        grep -A 10 "^compiled_ii:" "$yaml_file" 2>/dev/null | head -15 || echo "  (no data)"
    fi
done
