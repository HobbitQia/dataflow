// RUN: mkdir -p %t.dir
// RUN: cd %t.dir && mlir-neura-opt %s \
// RUN:   --lower-affine \
// RUN:   --convert-scf-to-cf \
// RUN:   --convert-cf-to-llvm \
// RUN:   --assign-accelerator \
// RUN:   --lower-memref-to-neura \
// RUN:   --lower-arith-to-neura \
// RUN:   --lower-builtin-to-neura \
// RUN:   --lower-llvm-to-neura \
// RUN:   --promote-input-arg-to-const \
// RUN:   --fold-constant \
// RUN:   --canonicalize-cast \
// RUN:   --canonicalize-return \
// RUN:   --canonicalize-live-in \
// RUN:   --leverage-predicated-value \
// RUN:   --transform-ctrl-to-data-flow \
// RUN:   --fold-constant \
// RUN:   --insert-data-mov \
// RUN:   --map-to-accelerator="mapping-strategy=heuristic" \
// RUN:   --architecture-spec=%S/../../arch_spec/architecture.yaml \
// RUN:   --generate-code -o %t.dir/mapping.mlir
// RUN: FileCheck %s --input-file=%t.dir/tmp-generated-instructions.yaml --check-prefix=YAML
// RUN: FileCheck %s --input-file=%t.dir/tmp-generated-memory-metadata.yaml --check-prefix=MEMORY

module {
  func.func @softmax_exp(%scores: memref<16xi32>, %probs: memref<16xi32>) {
    affine.for %j = 0 to 16 {
      %s = affine.load %scores[%j] : memref<16xi32>
      %e = arith.muli %s, %s : i32
      %c1 = arith.constant 1 : i32
      %e2 = arith.addi %e, %c1 : i32
      affine.store %e2, %probs[%j] : memref<16xi32>
    }
    return
  }
}

// YAML: opcode: "LOAD_INDEXED"
// YAML: opcode: "STORE_INDEXED"

// MEMORY: arguments:
// MEMORY: name: "%arg0"
// MEMORY: kind: "memref"
// MEMORY: type: "memref<16xi32>"
// MEMORY: name: "%arg1"
// MEMORY: kind: "memref"
// MEMORY: memory_ops:
// MEMORY: opcode: "LOAD_INDEXED"
// MEMORY: access: "read"
// MEMORY: value_type: "i32"
// MEMORY: access_bytes: 4
// MEMORY: root_arg: "%arg0"
// MEMORY: root_arg_kind: "memref"
// MEMORY: root_arg_type: "memref<16xi32>"
// MEMORY: address_unit: "word"
// MEMORY: chain: []
// MEMORY: opcode: "STORE_INDEXED"
// MEMORY: access: "write"
// MEMORY: value_type: "i32"
// MEMORY: access_bytes: 4
// MEMORY: root_arg: "%arg1"
// MEMORY: root_arg_kind: "memref"
// MEMORY: root_arg_type: "memref<16xi32>"
// MEMORY: address_unit: "word"
// MEMORY: chain: []
