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
