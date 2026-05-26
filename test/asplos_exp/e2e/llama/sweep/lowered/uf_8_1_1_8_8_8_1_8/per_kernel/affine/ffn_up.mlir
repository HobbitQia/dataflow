module {

func.func @ffn_up(%x: memref<16xi32>, %w_up: memref<16x16xi32>,
                   %up: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %up[%i] : memref<16xi32>
      %x_val = affine.load %x[%j] : memref<16xi32>
      %w_val = affine.load %w_up[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %x_val, %w_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %up[%i] : memref<16xi32>
    }
  }
  return
}

}
