module {

func.func @softmax_norm(%probs: memref<16xi32>, %sum_in: memref<1xi32>) {
  %denom = affine.load %sum_in[0] : memref<1xi32>
  affine.for %j = 0 to 16 {
    %v = affine.load %probs[%j] : memref<16xi32>
    %r = arith.divsi %v, %denom : i32
    affine.store %r, %probs[%j] : memref<16xi32>
  }
  return
}

}
