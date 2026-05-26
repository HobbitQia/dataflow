module {

func.func @output_gate(%o: memref<16xi32>, %c: memref<16xi32>,
                        %h_out: memref<16xi32>) {
  affine.for %idx = 0 to 16 {
    %ov = affine.load %o[%idx] : memref<16xi32>
    %cv = affine.load %c[%idx] : memref<16xi32>
    %cv2 = arith.muli %cv, %cv : i32
    %h = arith.muli %ov, %cv2 : i32
    affine.store %h, %h_out[%idx] : memref<16xi32>
  }
  return
}

}
