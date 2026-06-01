// Compiles flattened row-major int Jacobi2D to LLVM IR, imports it to MLIR,
// then lowers it via Neura and checks compiler-emitted memory metadata.
// RUN: clang++ -S -emit-llvm -O3 -fno-vectorize -fno-unroll-loops -std=c++17 \
// RUN:   -o %t-kernel-full.ll %S/../../benchmark/jacobi2d/jacobi2d_int.cpp
// RUN: llvm-extract --rfunc=".*kernel.*" %t-kernel-full.ll -o %t-kernel-only.ll
// RUN: mlir-translate --import-llvm %t-kernel-only.ll -o %t-kernel.mlir
//
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
// RUN: FileCheck %s --input-file=%t-mapping.mlir --check-prefix=MAPPING
// RUN: FileCheck %s --input-file=%t-generated-instructions.yaml --check-prefix=YAML
// RUN: FileCheck %s --input-file=%t-generated-instructions.asm --check-prefix=ASM
// RUN: FileCheck %s --input-file=%t-generated-memory-metadata.yaml --check-prefix=MEMORY

// MAPPING: func.func @kernel_jacobi2d_int
// MAPPING-SAME: mapping_info =
// MAPPING-SAME: x_tiles = 4 : i32
// MAPPING-SAME: y_tiles = 4 : i32
// MAPPING: "neura.load"
// MAPPING: "neura.store"

// YAML: array_config:
// YAML:   columns: 4
// YAML:   rows: 4
// YAML:   compiled_ii:
// YAML:     cores:
// YAML: opcode: "LOAD"
// YAML: opcode: "STORE"

// ASM: # Compiled II:
// ASM: PE(

// MEMORY: format_version: 1
// MEMORY: function:
// MEMORY:   name: "kernel_jacobi2d_int"
// MEMORY: arguments:
// MEMORY:   - name: "%arg0"
// MEMORY-NEXT:     index: 0
// MEMORY-NEXT:     kind: "pointer"
// MEMORY:   - name: "%arg1"
// MEMORY-NEXT:     index: 1
// MEMORY-NEXT:     kind: "pointer"
// MEMORY: memory_ops:
// MEMORY-DAG: opcode: "LOAD"
// MEMORY-DAG: opcode: "STORE"
// MEMORY-DAG: root_arg: "%arg0"
// MEMORY-DAG: root_arg: "%arg1"
