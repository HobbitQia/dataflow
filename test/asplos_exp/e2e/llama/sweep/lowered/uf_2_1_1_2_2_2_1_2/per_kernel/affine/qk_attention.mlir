module {

func.func @qk_attention(%q: memref<16xi32>, %k: memref<16x16xi32>,
                         %scores: memref<16xi32>) {
  affine.for %j = 0 to 16 {
    affine.for %d = 0 to 16 {
      %acc = affine.load %scores[%j] : memref<16xi32>
      %q_val = affine.load %q[%d] : memref<16xi32>
      %k_val = affine.load %k[%j, %d] : memref<16x16xi32>
      %prod = arith.muli %q_val, %k_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %scores[%j] : memref<16xi32>
    }
  }
  return
}

}
