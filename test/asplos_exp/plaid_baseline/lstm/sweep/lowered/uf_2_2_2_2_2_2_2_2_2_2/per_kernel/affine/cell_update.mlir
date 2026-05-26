module {

func.func @cell_update(%f: memref<16xi32>, %c_prev: memref<16xi32>,
                        %i_gate: memref<16xi32>, %g: memref<16xi32>,
                        %c: memref<16xi32>) {
  affine.for %idx = 0 to 16 {
    %fv = affine.load %f[%idx] : memref<16xi32>
    %cv = affine.load %c_prev[%idx] : memref<16xi32>
    %fc = arith.muli %fv, %cv : i32
    %iv = affine.load %i_gate[%idx] : memref<16xi32>
    %gv = affine.load %g[%idx] : memref<16xi32>
    %ig = arith.muli %iv, %gv : i32
    %c_new = arith.addi %fc, %ig : i32
    affine.store %c_new, %c[%idx] : memref<16xi32>
  }
  return
}

}
