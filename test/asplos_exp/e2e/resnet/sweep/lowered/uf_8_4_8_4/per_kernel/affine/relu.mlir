module {

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

}
