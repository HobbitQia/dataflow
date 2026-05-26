module {

func.func @i_gate_x(%x: memref<16xi32>, %w_i: memref<16x16xi32>, %tmp_i: memref<16xi32>) {
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
  return
}

func.func @f_gate_x(%x: memref<16xi32>, %w_f: memref<16x16xi32>, %tmp_f: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_f[%i] : memref<16xi32>
      %xv = affine.load %x[%j] : memref<16xi32>
      %wv = affine.load %w_f[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_f[%i] : memref<16xi32>
    }
  }
  return
}

func.func @o_gate_x(%x: memref<16xi32>, %w_o: memref<16x16xi32>, %tmp_o: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_o[%i] : memref<16xi32>
      %xv = affine.load %x[%j] : memref<16xi32>
      %wv = affine.load %w_o[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_o[%i] : memref<16xi32>
    }
  }
  return
}

func.func @g_gate_x(%x: memref<16xi32>, %w_g: memref<16x16xi32>, %tmp_g: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_g[%i] : memref<16xi32>
      %xv = affine.load %x[%j] : memref<16xi32>
      %wv = affine.load %w_g[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_g[%i] : memref<16xi32>
    }
  }
  return
}

func.func @i_gate_h(%h: memref<16xi32>, %u_i: memref<16x16xi32>, %tmp_i: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_i[%i] : memref<16xi32>
      %hv = affine.load %h[%j] : memref<16xi32>
      %uv = affine.load %u_i[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_i[%i] : memref<16xi32>
    }
  }
  return
}

func.func @f_gate_h(%h: memref<16xi32>, %u_f: memref<16x16xi32>, %tmp_f: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_f[%i] : memref<16xi32>
      %hv = affine.load %h[%j] : memref<16xi32>
      %uv = affine.load %u_f[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_f[%i] : memref<16xi32>
    }
  }
  return
}

func.func @o_gate_h(%h: memref<16xi32>, %u_o: memref<16x16xi32>, %tmp_o: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_o[%i] : memref<16xi32>
      %hv = affine.load %h[%j] : memref<16xi32>
      %uv = affine.load %u_o[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_o[%i] : memref<16xi32>
    }
  }
  return
}

func.func @g_gate_h(%h: memref<16xi32>, %u_g: memref<16x16xi32>, %tmp_g: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %tmp_g[%i] : memref<16xi32>
      %hv = affine.load %h[%j] : memref<16xi32>
      %uv = affine.load %u_g[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_g[%i] : memref<16xi32>
    }
  }
  return
}

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
