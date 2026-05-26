module {

func.func @ffn_act(%gate: memref<16xi32>, %up: memref<16xi32>,
                    %act: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    %g = affine.load %gate[%i] : memref<16xi32>
    %u = affine.load %up[%i] : memref<16xi32>
    %r = arith.muli %g, %u : i32
    affine.store %r, %act[%i] : memref<16xi32>
  }
  return
}

}
