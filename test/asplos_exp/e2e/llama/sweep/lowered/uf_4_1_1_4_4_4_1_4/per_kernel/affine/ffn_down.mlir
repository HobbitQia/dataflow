module {

func.func @ffn_down(%act: memref<16xi32>, %w_down: memref<16x16xi32>,
                     %output: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %output[%i] : memref<16xi32>
      %a_val = affine.load %act[%j] : memref<16xi32>
      %w_val = affine.load %w_down[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %a_val, %w_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %output[%i] : memref<16xi32>
    }
  }
  return
}

}
