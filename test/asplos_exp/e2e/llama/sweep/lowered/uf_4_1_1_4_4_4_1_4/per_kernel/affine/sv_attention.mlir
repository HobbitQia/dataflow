module {

func.func @sv_attention(%attn: memref<16xi32>, %v: memref<16x16xi32>,
                         %output: memref<16xi32>) {
  affine.for %d = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %output[%d] : memref<16xi32>
      %a_val = affine.load %attn[%j] : memref<16xi32>
      %v_val = affine.load %v[%j, %d] : memref<16x16xi32>
      %prod = arith.muli %a_val, %v_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %output[%d] : memref<16xi32>
    }
  }
  return
}

}
