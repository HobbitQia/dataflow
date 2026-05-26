module {

func.func @conv2d_1(%input_mat: memref<4096x576xi32>, %weight: memref<576xi32>,
                     %output: memref<4096xi32>) {
  affine.for %i = 0 to 4096 {
    affine.for %j = 0 to 576 {
      %acc = affine.load %output[%i] : memref<4096xi32>
      %a = affine.load %input_mat[%i, %j] : memref<4096x576xi32>
      %b = affine.load %weight[%j] : memref<576xi32>
      %prod = arith.muli %a, %b : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %output[%i] : memref<4096xi32>
    }
  }
  return
}

func.func @relu(%input: memref<4096xi32>, %output: memref<4096xi32>) {
  %c0 = arith.constant 0 : i32
  affine.for %i = 0 to 4096 {
    %v = affine.load %input[%i] : memref<4096xi32>
    %cmp = arith.cmpi sgt, %v, %c0 : i32
    %r = arith.select %cmp, %v, %c0 : i32
    affine.store %r, %output[%i] : memref<4096xi32>
  }
  return
}

func.func @conv2d_2(%input_mat: memref<4096x576xi32>, %weight: memref<576xi32>,
                     %output: memref<4096xi32>) {
  affine.for %i = 0 to 4096 {
    affine.for %j = 0 to 576 {
      %acc = affine.load %output[%i] : memref<4096xi32>
      %a = affine.load %input_mat[%i, %j] : memref<4096x576xi32>
      %b = affine.load %weight[%j] : memref<576xi32>
      %prod = arith.muli %a, %b : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %output[%i] : memref<4096xi32>
    }
  }
  return
}

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
