module {

func.func @add_residual(%a: memref<4096xi32>, %b: memref<4096xi32>,
                         %output: memref<4096xi32>) {
  affine.for %i = 0 to 4096 {
    %va = affine.load %a[%i] : memref<4096xi32>
    %vb = affine.load %b[%i] : memref<4096xi32>
    %sum = arith.addi %va, %vb : i32
    affine.store %sum, %output[%i] : memref<4096xi32>
  }
  return
}

}
