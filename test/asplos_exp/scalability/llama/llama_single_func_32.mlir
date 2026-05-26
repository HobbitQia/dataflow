module {

func.func @llama_attention_ffn(%q: memref<32xi32>, %k: memref<32x32xi32>,
                                %scores: memref<32xi32>,
                                %probs: memref<32xi32>,
                                %sum_buf: memref<1xi32>,
                                %v: memref<32x32xi32>, %sv_out: memref<32xi32>,
                                %w_gate: memref<32x32xi32>, %gate: memref<32xi32>,
                                %w_up: memref<32x32xi32>, %up: memref<32xi32>,
                                %act: memref<32xi32>,
                                %w_down: memref<32x32xi32>, %output: memref<32xi32>) {
  %c0 = arith.constant 0 : i32
  %c1 = arith.constant 1 : i32

  affine.for %j = 0 to 32 {
    affine.for %d = 0 to 32 {
      %acc = affine.load %scores[%j] : memref<32xi32>
      %q_val = affine.load %q[%d] : memref<32xi32>
      %k_val = affine.load %k[%j, %d] : memref<32x32xi32>
      %prod = arith.muli %q_val, %k_val : i32
      %sum = arith.addi %acc, %prod : i32
      affine.store %sum, %scores[%j] : memref<32xi32>
    }
  }

  affine.for %j2 = 0 to 32 {
    %sv = affine.load %scores[%j2] : memref<32xi32>
    %e = arith.muli %sv, %sv : i32
    %e2 = arith.addi %e, %c1 : i32
    affine.store %e2, %probs[%j2] : memref<32xi32>
  }

  %denom = affine.load %sum_buf[0] : memref<1xi32>
  affine.for %j3 = 0 to 32 {
    %pv = affine.load %probs[%j3] : memref<32xi32>
    %normed = arith.divsi %pv, %denom : i32
    affine.store %normed, %probs[%j3] : memref<32xi32>
  }

  affine.for %d2 = 0 to 32 {
    affine.for %j4 = 0 to 32 {
      %acc2 = affine.load %sv_out[%d2] : memref<32xi32>
      %a_val = affine.load %probs[%j4] : memref<32xi32>
      %v_val = affine.load %v[%j4, %d2] : memref<32x32xi32>
      %prod2 = arith.muli %a_val, %v_val : i32
      %sum2 = arith.addi %acc2, %prod2 : i32
      affine.store %sum2, %sv_out[%d2] : memref<32xi32>
    }
  }

  affine.for %i = 0 to 32 {
    affine.for %j5 = 0 to 32 {
      %acc3 = affine.load %gate[%i] : memref<32xi32>
      %x_val = affine.load %sv_out[%j5] : memref<32xi32>
      %w_val = affine.load %w_gate[%i, %j5] : memref<32x32xi32>
      %prod3 = arith.muli %x_val, %w_val : i32
      %sum3 = arith.addi %acc3, %prod3 : i32
      affine.store %sum3, %gate[%i] : memref<32xi32>
    }
  }

  affine.for %i2 = 0 to 32 {
    affine.for %j6 = 0 to 32 {
      %acc4 = affine.load %up[%i2] : memref<32xi32>
      %x_val2 = affine.load %sv_out[%j6] : memref<32xi32>
      %w_val2 = affine.load %w_up[%i2, %j6] : memref<32x32xi32>
      %prod4 = arith.muli %x_val2, %w_val2 : i32
      %sum4 = arith.addi %acc4, %prod4 : i32
      affine.store %sum4, %up[%i2] : memref<32xi32>
    }
  }

  affine.for %i3 = 0 to 32 {
    %g = affine.load %gate[%i3] : memref<32xi32>
    %u = affine.load %up[%i3] : memref<32xi32>
    %a = arith.muli %g, %u : i32
    affine.store %a, %act[%i3] : memref<32xi32>
  }

  affine.for %i4 = 0 to 32 {
    affine.for %j7 = 0 to 32 {
      %acc5 = affine.load %output[%i4] : memref<32xi32>
      %a_val2 = affine.load %act[%j7] : memref<32xi32>
      %w_val3 = affine.load %w_down[%i4, %j7] : memref<32x32xi32>
      %prod5 = arith.muli %a_val2, %w_val3 : i32
      %sum5 = arith.addi %acc5, %prod5 : i32
      affine.store %sum5, %output[%i4] : memref<32xi32>
    }
  }

  return
}

}
