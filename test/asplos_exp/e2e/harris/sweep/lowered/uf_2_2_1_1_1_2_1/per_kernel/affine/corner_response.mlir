module {

func.func @corner_response(%Sxx: memref<64x64xi32>, %Syy: memref<64x64xi32>,
                            %Sxy: memref<64x64xi32>, %R: memref<64x64xi32>) {
  %k = arith.constant 4 : i32
  affine.for %i = 2 to 62 {
    affine.for %j = 2 to 62 {
      %sxx = affine.load %Sxx[%i, %j] : memref<64x64xi32>
      %syy = affine.load %Syy[%i, %j] : memref<64x64xi32>
      %sxy = affine.load %Sxy[%i, %j] : memref<64x64xi32>
      %det_a = arith.muli %sxx, %syy : i32
      %det_b = arith.muli %sxy, %sxy : i32
      %det = arith.subi %det_a, %det_b : i32
      %trace = arith.addi %sxx, %syy : i32
      %trace_sq = arith.muli %trace, %trace : i32
      %k_trace = arith.muli %k, %trace_sq : i32
      %r = arith.subi %det, %k_trace : i32
      affine.store %r, %R[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

}
