module {

func.func @ixy(%Ix: memref<64x64xi32>, %Iy: memref<64x64xi32>,
                %Ixy: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %vx = affine.load %Ix[%i, %j] : memref<64x64xi32>
      %vy = affine.load %Iy[%i, %j] : memref<64x64xi32>
      %r = arith.muli %vx, %vy : i32
      affine.store %r, %Ixy[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

}
