// Compiles the parameterized streaming FIR kernel to MLIR, then lowers it via Neura.
// RUN: clang++ -S -emit-llvm -O3 -fno-vectorize -fno-unroll-loops -std=c++17 -DN=16 -DNTAPS=8 -o %t-kernel-full.ll %S/../../benchmark/fir/fir_stream_int.cpp
// RUN: llvm-extract --rfunc=".*kernel.*" %t-kernel-full.ll -o %t-kernel-only.ll
// RUN: mlir-translate --import-llvm %t-kernel-only.ll -o %t-kernel.mlir

// RUN: mkdir -p %t.dir
// RUN: cp %t-kernel.mlir %t.dir/
// RUN: cd %t.dir && mlir-neura-opt %t-kernel.mlir \
// RUN:   --assign-accelerator \
// RUN:   --lower-llvm-to-neura \
// RUN:   --promote-input-arg-to-const \
// RUN:   --fold-constant \
// RUN:   --canonicalize-return \
// RUN:   --canonicalize-live-in \
// RUN:   --leverage-predicated-value \
// RUN:   --transform-ctrl-to-data-flow \
// RUN:   --fold-constant \
// RUN:   --insert-data-mov \
// RUN:   --map-to-accelerator="mapping-strategy=heuristic" \
// RUN:   --architecture-spec=%S/../../arch_spec/architecture.yaml \
// RUN:   --generate-code -o %t-mapping.mlir
// RUN: cp %t.dir/tmp-generated-instructions.yaml %t-generated-instructions.yaml
// RUN: cp %t.dir/tmp-generated-instructions.asm %t-generated-instructions.asm
// RUN: cp %t.dir/tmp-generated-memory-metadata.yaml %t-generated-memory-metadata.yaml
// RUN: FileCheck %s --input-file=%t-mapping.mlir -check-prefix=MAPPING
// RUN: FileCheck %s --input-file=%t-generated-instructions.yaml --check-prefix=YAML
// RUN: FileCheck %s --input-file=%t-generated-memory-metadata.yaml --check-prefix=MEMORY

// MAPPING-LABEL: func.func {{.*}}kernel
// MAPPING: "neura.load"
// MAPPING: "neura.mul"
// MAPPING: "neura.store"
// MAPPING: neura.return_void

// YAML: compiled_ii:
// YAML-DAG: opcode: "LOAD"
// YAML-DAG: opcode: "STORE"

// MEMORY: format_version: 1
// MEMORY: arguments:
// MEMORY-DAG: name: "%arg0"
// MEMORY-DAG: name: "%arg1"
// MEMORY-DAG: name: "%arg2"
// MEMORY: memory_ops:
// MEMORY-DAG: opcode: "LOAD"
// MEMORY-DAG: opcode: "STORE"
// MEMORY-DAG: root_arg: "%arg0"
// MEMORY-DAG: root_arg: "%arg1"
// MEMORY-DAG: root_arg: "%arg2"
