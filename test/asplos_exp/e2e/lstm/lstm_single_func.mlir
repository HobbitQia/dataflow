module {

func.func @lstm_cell(%x: memref<16xi32>, %h_prev: memref<16xi32>,
                      %w_i: memref<16x16xi32>, %w_f: memref<16x16xi32>,
                      %w_o: memref<16x16xi32>, %w_g: memref<16x16xi32>,
                      %u_i: memref<16x16xi32>, %u_f: memref<16x16xi32>,
                      %u_o: memref<16x16xi32>, %u_g: memref<16x16xi32>,
                      %tmp_i: memref<16xi32>, %tmp_f: memref<16xi32>,
                      %tmp_o: memref<16xi32>, %tmp_g: memref<16xi32>,
                      %c_prev: memref<16xi32>, %c: memref<16xi32>,
                      %h_out: memref<16xi32>) {

  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_i[%i] : memref<16xi32>
      %xv = affine.load %x[%j] : memref<16xi32>
      %wv = affine.load %w_i[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_i[%i] : memref<16xi32>
    }
  }

  affine.for %i2 = 0 to 16 {
    affine.for %j2 = 0 to 16 {
      %acc2 = affine.load %tmp_f[%i2] : memref<16xi32>
      %xv2 = affine.load %x[%j2] : memref<16xi32>
      %wv2 = affine.load %w_f[%i2, %j2] : memref<16x16xi32>
      %prod2 = arith.muli %xv2, %wv2 : i32
      %sum2 = arith.addi %acc2, %prod2 : i32
      affine.store %sum2, %tmp_f[%i2] : memref<16xi32>
    }
  }

  affine.for %i3 = 0 to 16 {
    affine.for %j3 = 0 to 16 {
      %acc3 = affine.load %tmp_o[%i3] : memref<16xi32>
      %xv3 = affine.load %x[%j3] : memref<16xi32>
      %wv3 = affine.load %w_o[%i3, %j3] : memref<16x16xi32>
      %prod3 = arith.muli %xv3, %wv3 : i32
      %sum3 = arith.addi %acc3, %prod3 : i32
      affine.store %sum3, %tmp_o[%i3] : memref<16xi32>
    }
  }

  affine.for %i4 = 0 to 16 {
    affine.for %j4 = 0 to 16 {
      %acc4 = affine.load %tmp_g[%i4] : memref<16xi32>
      %xv4 = affine.load %x[%j4] : memref<16xi32>
      %wv4 = affine.load %w_g[%i4, %j4] : memref<16x16xi32>
      %prod4 = arith.muli %xv4, %wv4 : i32
      %sum4 = arith.addi %acc4, %prod4 : i32
      affine.store %sum4, %tmp_g[%i4] : memref<16xi32>
    }
  }

  affine.for %i5 = 0 to 16 {
    affine.for %j5 = 0 to 16 {
      %acc5 = affine.load %tmp_i[%i5] : memref<16xi32>
      %hv = affine.load %h_prev[%j5] : memref<16xi32>
      %uv = affine.load %u_i[%i5, %j5] : memref<16x16xi32>
      %prod5 = arith.muli %hv, %uv : i32
      %sum5 = arith.addi %acc5, %prod5 : i32
      affine.store %sum5, %tmp_i[%i5] : memref<16xi32>
    }
  }

  affine.for %i6 = 0 to 16 {
    affine.for %j6 = 0 to 16 {
      %acc6 = affine.load %tmp_f[%i6] : memref<16xi32>
      %hv2 = affine.load %h_prev[%j6] : memref<16xi32>
      %uv2 = affine.load %u_f[%i6, %j6] : memref<16x16xi32>
      %prod6 = arith.muli %hv2, %uv2 : i32
      %sum6 = arith.addi %acc6, %prod6 : i32
      affine.store %sum6, %tmp_f[%i6] : memref<16xi32>
    }
  }

  affine.for %i7 = 0 to 16 {
    affine.for %j7 = 0 to 16 {
      %acc7 = affine.load %tmp_o[%i7] : memref<16xi32>
      %hv3 = affine.load %h_prev[%j7] : memref<16xi32>
      %uv3 = affine.load %u_o[%i7, %j7] : memref<16x16xi32>
      %prod7 = arith.muli %hv3, %uv3 : i32
      %sum7 = arith.addi %acc7, %prod7 : i32
      affine.store %sum7, %tmp_o[%i7] : memref<16xi32>
    }
  }

  affine.for %i8 = 0 to 16 {
    affine.for %j8 = 0 to 16 {
      %acc8 = affine.load %tmp_g[%i8] : memref<16xi32>
      %hv4 = affine.load %h_prev[%j8] : memref<16xi32>
      %uv4 = affine.load %u_g[%i8, %j8] : memref<16x16xi32>
      %prod8 = arith.muli %hv4, %uv4 : i32
      %sum8 = arith.addi %acc8, %prod8 : i32
      affine.store %sum8, %tmp_g[%i8] : memref<16xi32>
    }
  }

  affine.for %idx = 0 to 16 {
    %fv = affine.load %tmp_f[%idx] : memref<16xi32>
    %cv = affine.load %c_prev[%idx] : memref<16xi32>
    %fc = arith.muli %fv, %cv : i32
    %iv = affine.load %tmp_i[%idx] : memref<16xi32>
    %gv = affine.load %tmp_g[%idx] : memref<16xi32>
    %ig = arith.muli %iv, %gv : i32
    %c_new = arith.addi %fc, %ig : i32
    affine.store %c_new, %c[%idx] : memref<16xi32>
  }

  affine.for %idx2 = 0 to 16 {
    %ov = affine.load %tmp_o[%idx2] : memref<16xi32>
    %cv2 = affine.load %c[%idx2] : memref<16xi32>
    %cv_sq = arith.muli %cv2, %cv2 : i32
    %h = arith.muli %ov, %cv_sq : i32
    affine.store %h, %h_out[%idx2] : memref<16xi32>
  }

  return
}

}
