module {

func.func @iyy(%Iy: memref<64x64xi32>, %Iyy: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v = affine.load %Iy[%i, %j] : memref<64x64xi32>
      %r = arith.muli %v, %v : i32
      affine.store %r, %Iyy[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

}
