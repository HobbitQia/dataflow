module {

func.func @qk_attention(%q: memref<16xi32>, %k: memref<16x16xi32>,
                         %scores: memref<16xi32>) {
  affine.for %j = 0 to 16 {
    affine.for %d = 0 to 16 {
      %acc = affine.load %scores[%j] : memref<16xi32>
      %q_val = affine.load %q[%d] : memref<16xi32>
      %k_val = affine.load %k[%j, %d] : memref<16x16xi32>
      %prod = arith.muli %q_val, %k_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %scores[%j] : memref<16xi32>
    }
  }
  return
}

func.func @softmax_exp(%scores: memref<16xi32>, %probs: memref<16xi32>) {
  affine.for %j = 0 to 16 {
    %s = affine.load %scores[%j] : memref<16xi32>
    %e = arith.muli %s, %s : i32
    %c1 = arith.constant 1 : i32
    %e2 = arith.addi %e, %c1 : i32
    affine.store %e2, %probs[%j] : memref<16xi32>
  }
  return
}

func.func @softmax_norm(%probs: memref<16xi32>, %sum_in: memref<1xi32>) {
  %denom = affine.load %sum_in[0] : memref<1xi32>
  affine.for %j = 0 to 16 {
    %v = affine.load %probs[%j] : memref<16xi32>
    %r = arith.divsi %v, %denom : i32
    affine.store %r, %probs[%j] : memref<16xi32>
  }
  return
}

func.func @sv_attention(%attn: memref<16xi32>, %v: memref<16x16xi32>,
                         %output: memref<16xi32>) {
  affine.for %d = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %output[%d] : memref<16xi32>
      %a_val = affine.load %attn[%j] : memref<16xi32>
      %v_val = affine.load %v[%j, %d] : memref<16x16xi32>
      %prod = arith.muli %a_val, %v_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %output[%d] : memref<16xi32>
    }
  }
  return
}

func.func @ffn_gate(%x: memref<16xi32>, %w_gate: memref<16x16xi32>,
                     %gate: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %gate[%i] : memref<16xi32>
      %x_val = affine.load %x[%j] : memref<16xi32>
      %w_val = affine.load %w_gate[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %x_val, %w_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %gate[%i] : memref<16xi32>
    }
  }
  return
}

func.func @ffn_up(%x: memref<16xi32>, %w_up: memref<16x16xi32>,
                   %up: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %up[%i] : memref<16xi32>
      %x_val = affine.load %x[%j] : memref<16xi32>
      %w_val = affine.load %w_up[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %x_val, %w_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %up[%i] : memref<16xi32>
    }
  }
  return
}

func.func @ffn_act(%gate: memref<16xi32>, %up: memref<16xi32>,
                    %act: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    %g = affine.load %gate[%i] : memref<16xi32>
    %u = affine.load %up[%i] : memref<16xi32>
    %r = arith.muli %g, %u : i32
    affine.store %r, %act[%i] : memref<16xi32>
  }
  return
}

func.func @ffn_down(%act: memref<16xi32>, %w_down: memref<16x16xi32>,
                     %output: memref<16xi32>) {
  affine.for %i = 0 to 16 {
    affine.for %j = 0 to 16 {
      %acc = affine.load %output[%i] : memref<16xi32>
      %a_val = affine.load %act[%j] : memref<16xi32>
      %w_val = affine.load %w_down[%i, %j] : memref<16x16xi32>
      %prod = arith.muli %a_val, %w_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %output[%i] : memref<16xi32>
    }
  }
  return
}

}
