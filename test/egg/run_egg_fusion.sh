#!/bin/bash

# Egg Fusion Test Script
# This script demonstrates the complete pipeline from C++ to hardware mapping
# using egg-based equality saturation for pattern fusion

# mlir-neura-opt --area-spec=./area_spec.yaml --egg-process-neura kernel_before0.mlir -o kernel_after0_fused.mlir 2>1.txt

set -e  # Exit on error

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Egg Fusion Test Pipeline ===${NC}"

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="../../build"
MLIR_OPT="$BUILD_DIR/tools/mlir-neura-opt/mlir-neura-opt"

# Input file
INPUT_CPP="kernel.cpp"
ARCH_SPEC="architecture.yaml"
LATENCY_SPEC="latency_map.yaml"

# Check if input file exists
if [ ! -f "$INPUT_CPP" ]; then
    echo -e "${RED}Error: $INPUT_CPP not found${NC}"
    exit 1
fi

# Check if mlir-neura-opt exists
if [ ! -f "$MLIR_OPT" ]; then
    echo -e "${RED}Error: mlir-neura-opt not found at $MLIR_OPT${NC}"
    echo "Please build the project first"
    exit 1
fi

echo -e "${YELLOW}Step 1: Compiling C++ to LLVM IR${NC}"
clang++ -S -emit-llvm -O0 -fno-unroll-loops -fno-vectorize $INPUT_CPP -o kernel.ll
echo -e "${GREEN}✓ Generated kernel.ll${NC}"

echo -e "${YELLOW}Step 2: Importing LLVM IR to MLIR${NC}"
mlir-translate --import-llvm kernel.ll -o kernel.mlir
echo -e "${GREEN}✓ Generated kernel.mlir${NC}"

echo -e "${YELLOW}Step 3: Initial lowering to Neura dialect${NC}"
$MLIR_OPT --architecture-spec=$ARCH_SPEC \
          --verify-each=true \
          --mlir-print-ir-after-failure \
          --assign-accelerator \
          --lower-llvm-to-neura \
          --promote-func-arg-to-const \
          --canonicalize-return \
          --canonicalize-cast \
          --canonicalize-live-in \
          --leverage-predicated-value \
          --fold-constant \
          kernel.mlir -o kernel_before.mlir
echo -e "${GREEN}✓ Generated kernel_before.mlir${NC}"

echo -e "${YELLOW}Step 4: Transform control flow to dataflow${NC}"
$MLIR_OPT --architecture-spec=$ARCH_SPEC \
          --verify-each=true \
          --mlir-print-ir-after-failure \
          --transform-ctrl-to-data-flow \
          --fold-constant \
          kernel_before.mlir -o kernel_before0.mlir
echo -e "${GREEN}✓ Generated kernel_before0.mlir${NC}"

echo -e "${YELLOW}Step 5: Egg-based pattern fusion (E-graph optimization)${NC}"
echo -e "${YELLOW}  - Extracting patterns with equality saturation${NC}"
echo -e "${YELLOW}  - Generating multi-output fused_op operations${NC}"
$MLIR_OPT --area-spec=./ppa_spec.yaml \
          --egg-process-neura="max-pattern-area=50000 max-pattern-ops=20" \
          kernel_before0.mlir -o kernel_after0_fused.mlir 2>&1 | tee egg_fusion.log
# echo -e "${GREEN}✓ Generated kernel_after0_fused.mlir with fused operations${NC}"

echo -e "${YELLOW}Step 6: Insert data movement operations${NC}"
$MLIR_OPT --insert-data-mov \
          kernel_after0_fused.mlir -o kernel_after1.mlir
# echo -e "${GREEN}✓ Generated kernel_after1.mlir${NC}"

# echo -e "${YELLOW}Step 7: Map to accelerator hardware${NC}"
$MLIR_OPT --architecture-spec=$ARCH_SPEC \
          --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
          kernel_after1.mlir -o kernel_after2.mlir
echo -e "${GREEN}✓ Generated kernel_after2.mlir${NC}"
