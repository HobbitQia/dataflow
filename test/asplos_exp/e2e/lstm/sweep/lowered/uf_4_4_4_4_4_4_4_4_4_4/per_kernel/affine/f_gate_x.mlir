module {

func.func @f_gate_x(%x: memref<16xi32>, %w_f: memref<16x16xi32>, %tmp_f: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_f[%i] : memref<16xi32>
      %xv = affine.load %x[%j] : memref<16xi32>
      %wv = affine.load %w_f[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_f[%i] : memref<16xi32>
    }
  }
  return
}

}
