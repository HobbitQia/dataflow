module {

func.func @conv2d_1_relu(%in_mat1: memref<4096x576xi32>, %w1: memref<576xi32>,
                          %conv1_out: memref<4096xi32>, %relu_out: memref<4096xi32>) {
  %c0 = arith.constant 0 : i32
  affine.for %i = 0 to 4096 {
    affine.for %j = 0 to 576 {
      %acc = affine.load %conv1_out[%i] : memref<4096xi32>
      %a = affine.load %in_mat1[%i, %j] : memref<4096x576xi32>
      %b = affine.load %w1[%j] : memref<576xi32>
      %prod = arith.muli %a, %b : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %conv1_out[%i] : memref<4096xi32>
      %v = affine.load %conv1_out[%i] : memref<4096xi32>
      %cmp = arith.cmpi sgt, %v, %c0 : i32
      %r = arith.select %cmp, %v, %c0 : i32
      affine.store %r, %relu_out[%i] : memref<4096xi32>
    }
  }
  return
}

func.func @conv2d_2_add(%in_mat2: memref<4096x576xi32>, %w2: memref<576xi32>,
                         %conv2_out: memref<4096xi32>,
                         %residual: memref<4096xi32>, %output: memref<4096xi32>) {
  affine.for %i = 0 to 4096 {
    affine.for %j = 0 to 576 {
      %acc = affine.load %conv2_out[%i] : memref<4096xi32>
      %a = affine.load %in_mat2[%i, %j] : memref<4096x576xi32>
      %b = affine.load %w2[%j] : memref<576xi32>
      %prod = arith.muli %a, %b : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %conv2_out[%i] : memref<4096xi32>
      %va = affine.load %conv2_out[%i] : memref<4096xi32>
      %vb = affine.load %residual[%i] : memref<4096xi32>
      %sum2 = arith.addi %va, %vb : i32
      affine.store %sum2, %output[%i] : memref<4096xi32>
    }
  }
  return
}

}
