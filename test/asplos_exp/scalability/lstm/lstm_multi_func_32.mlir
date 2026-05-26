module {

func.func @i_gate_x(%x: memref<32xi32>, %w_i: memref<32x32xi32>, %tmp_i: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_i[%i] : memref<32xi32>
      %xv = affine.load %x[%j] : memref<32xi32>
      %wv = affine.load %w_i[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_i[%i] : memref<32xi32>
    }
  }
  return
}

func.func @f_gate_x(%x: memref<32xi32>, %w_f: memref<32x32xi32>, %tmp_f: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_f[%i] : memref<32xi32>
      %xv = affine.load %x[%j] : memref<32xi32>
      %wv = affine.load %w_f[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_f[%i] : memref<32xi32>
    }
  }
  return
}

func.func @o_gate_x(%x: memref<32xi32>, %w_o: memref<32x32xi32>, %tmp_o: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_o[%i] : memref<32xi32>
      %xv = affine.load %x[%j] : memref<32xi32>
      %wv = affine.load %w_o[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_o[%i] : memref<32xi32>
    }
  }
  return
}

func.func @g_gate_x(%x: memref<32xi32>, %w_g: memref<32x32xi32>, %tmp_g: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_g[%i] : memref<32xi32>
      %xv = affine.load %x[%j] : memref<32xi32>
      %wv = affine.load %w_g[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %xv, %wv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_g[%i] : memref<32xi32>
    }
  }
  return
}

func.func @i_gate_h(%h: memref<32xi32>, %u_i: memref<32x32xi32>, %tmp_i: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_i[%i] : memref<32xi32>
      %hv = affine.load %h[%j] : memref<32xi32>
      %uv = affine.load %u_i[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_i[%i] : memref<32xi32>
    }
  }
  return
}

func.func @f_gate_h(%h: memref<32xi32>, %u_f: memref<32x32xi32>, %tmp_f: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_f[%i] : memref<32xi32>
      %hv = affine.load %h[%j] : memref<32xi32>
      %uv = affine.load %u_f[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_f[%i] : memref<32xi32>
    }
  }
  return
}

func.func @o_gate_h(%h: memref<32xi32>, %u_o: memref<32x32xi32>, %tmp_o: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_o[%i] : memref<32xi32>
      %hv = affine.load %h[%j] : memref<32xi32>
      %uv = affine.load %u_o[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_o[%i] : memref<32xi32>
    }
  }
  return
}

func.func @g_gate_h(%h: memref<32xi32>, %u_g: memref<32x32xi32>, %tmp_g: memref<32xi32>) {
  affine.for %i = 0 to 32 {
    affine.for %j = 0 to 32 {
      %acc = affine.load %tmp_g[%i] : memref<32xi32>
      %hv = affine.load %h[%j] : memref<32xi32>
      %uv = affine.load %u_g[%i, %j] : memref<32x32xi32>
      %prod = arith.muli %hv, %uv : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %tmp_g[%i] : memref<32xi32>
    }
  }
  return
}

func.func @cell_update(%f: memref<32xi32>, %c_prev: memref<32xi32>,
                        %i_gate: memref<32xi32>, %g: memref<32xi32>,
                        %c: memref<32xi32>) {
  affine.for %idx = 0 to 32 {
    %fv = affine.load %f[%idx] : memref<32xi32>
    %cv = affine.load %c_prev[%idx] : memref<32xi32>
    %fc = arith.muli %fv, %cv : i32
    %iv = affine.load %i_gate[%idx] : memref<32xi32>
    %gv = affine.load %g[%idx] : memref<32xi32>
    %ig = arith.muli %iv, %gv : i32
    %c_new = arith.addi %fc, %ig : i32
    affine.store %c_new, %c[%idx] : memref<32xi32>
  }
  return
}

func.func @output_gate(%o: memref<32xi32>, %c: memref<32xi32>,
                        %h_out: memref<32xi32>) {
  affine.for %idx = 0 to 32 {
    %ov = affine.load %o[%idx] : memref<32xi32>
    %cv = affine.load %c[%idx] : memref<32xi32>
    %cv2 = arith.muli %cv, %cv : i32
    %h = arith.muli %ov, %cv2 : i32
    affine.store %h, %h_out[%idx] : memref<32xi32>
  }
  return
}

}
