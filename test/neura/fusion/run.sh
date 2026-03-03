#!/bin/bash
set -e

ARCH_SPEC=/mnt/public/qjj/dataflow/test/neura/fusion/architecture.yaml
LATENCY_SPEC=/mnt/public/qjj/dataflow/test/neura/fusion/latency_map.yaml

clang++ -S -emit-llvm -O3 -fno-unroll-loops -fno-vectorize kernel.cpp -o kernel.ll

mlir-translate --import-llvm kernel.ll -o kernel.mlir

mlir-neura-opt --architecture-spec=$ARCH_SPEC --verify-each=true \
  --assign-accelerator \
  --lower-llvm-to-neura \
  --promote-input-arg-to-const \
  --canonicalize-return \
  --canonicalize-cast \
  --canonicalize-live-in \
  --leverage-predicated-value \
  --fold-constant kernel.mlir -o kernel_before.mlir

mlir-neura-opt --architecture-spec=$ARCH_SPEC --verify-each=true \
  --transform-ctrl-to-data-flow \
  --fold-constant kernel_before.mlir -o kernel_before0.mlir

mlir-neura-opt --verify-each=true \
  --iter-merge-pattern="min-support=3 max-iter=4" kernel_before0.mlir -o kernel_after0.mlir

mlir-neura-opt --hardware-merge="output=hardware_config.json" --verify-each=true \
  kernel_after0.mlir -o kernel_after01.mlir

mlir-neura-opt --init-exec-latency --latency-spec=$LATENCY_SPEC \
  kernel_after01.mlir -o kernel_after1.mlir

mlir-neura-opt --insert-data-mov kernel_after1.mlir -o kernel_after2.mlir

mlir-neura-opt --architecture-spec=$ARCH_SPEC \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=hardware_config.json" \
  kernel_after2.mlir -o kernel_after3.mlir