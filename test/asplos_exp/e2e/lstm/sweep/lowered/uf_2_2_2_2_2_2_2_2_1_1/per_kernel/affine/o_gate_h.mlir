module {

func.func @o_gate_h(%h: memref<16xi32>, %u_o: memref<16x16xi32>, %tmp_o: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_o[%i] : memref<16xi32>
      %hv = affine.load %h[%j] : memref<16xi32>
      %uv = affine.load %u_o[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_o[%i] : memref<16xi32>
    }
  }
  return
}

}
