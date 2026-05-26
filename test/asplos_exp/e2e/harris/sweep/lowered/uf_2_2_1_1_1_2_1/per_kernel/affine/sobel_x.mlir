module {

func.func @sobel_x(%img: memref<64x64xi32>, %Ix: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v00 = affine.load %img[%i - 1, %j - 1] : memref<64x64xi32>
      %v01 = affine.load %img[%i - 1, %j]     : memref<64x64xi32>
      %v02 = affine.load %img[%i - 1, %j + 1] : memref<64x64xi32>
      %v10 = affine.load %img[%i,     %j - 1] : memref<64x64xi32>
      %v12 = affine.load %img[%i,     %j + 1] : memref<64x64xi32>
      %v20 = affine.load %img[%i + 1, %j - 1] : memref<64x64xi32>
      %v21 = affine.load %img[%i + 1, %j]     : memref<64x64xi32>
      %v22 = affine.load %img[%i + 1, %j + 1] : memref<64x64xi32>
      %c2 = arith.constant 2 : i32
      %t0 = arith.muli %v01, %c2 : i32
      %t1 = arith.muli %v21, %c2 : i32
      %neg_v00 = arith.subi %v02, %v00 : i32
      %neg_v20 = arith.subi %v22, %v20 : i32
      %s0 = arith.addi %neg_v00, %t0 : i32
      %s1 = arith.subi %s0, %t1 : i32
      %gx = arith.addi %s1, %neg_v20 : i32
      affine.store %gx, %Ix[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

}
