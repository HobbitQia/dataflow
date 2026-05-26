module {

func.func @ixx(%Ix: memref<64x64xi32>, %Ixx: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v = affine.load %Ix[%i, %j] : memref<64x64xi32>
      %r = arith.muli %v, %v : i32
      affine.store %r, %Ixx[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

}
