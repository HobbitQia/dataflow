module {
  func.func @llama_attention_ffn(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: memref<1xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16x16xi32>, %arg13: memref<16xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %c1_i32 = arith.constant {latency = 1 : i32} 1 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.add"(%63) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64, %65, %66, %67 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%9) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = neura.load_indexed [%63, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%30, %10, %11) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%29, %12, %13) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.fused_op"(%28, %37, %38) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%27, %42, %43) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%26, %47, %48) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%5) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%25, %52, %53) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:2 = "neura.fused_op"(%4) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%24, %57, %58) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%23, %31) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = "neura.add"(%63, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %40 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<16xi32>) dependency_write_in(%arg3 : memref<16xi32>) value_inputs(%c1_i32 : i32) [original_read_memrefs(%arg2 : memref<16xi32>), original_write_memrefs(%arg3 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg14, %arg16, %arg15 : memref<16xi32>, i32, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<16xi32>, %arg18: i32, %arg19: memref<16xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %31 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%31) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%35, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%31) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %33, %34, %37, %38, %41 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%2#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%8) <{frequency = 42 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %31 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17:2 = "neura.fused_op"(%7) <{frequency = 42 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %31 = "neura.add"(%arg20) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20:2 = "neura.fused_op"(%6) <{frequency = 42 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %31 = "neura.add"(%arg20) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %21 = "neura.data_mov"(%20#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%20#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23:2 = "neura.fused_op"(%5) <{frequency = 42 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %31 = "neura.add"(%arg20) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %24 = "neura.data_mov"(%23#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26:2 = "neura.fused_op"(%4) <{frequency = 42 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %31 = "neura.add"(%arg20) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %27 = "neura.data_mov"(%26#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.add"(%9) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %19 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %22 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %25 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %28 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14 : memref<16xi32>) writes(%arg15 : memref<16xi32>)
    }
    %0 = memref.load %arg4[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out_1 : memref<16xi32>) dependency_write_in(%dependency_write_out_1 : memref<16xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg3 : memref<16xi32>), original_write_memrefs(%arg3 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg15, %arg16 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<16xi32>, %arg18: i32):
        %2:6 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:counter->load_indexed->fused_op:fused_op:add->load_indexed->div->fused_op:fused_op:add->load_indexed->div"}> ({
          %31 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.add"(%31) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.div"(%34) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%31) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %32, %33, %35, %36, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%2#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%8) <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %31 = "neura.add"(%arg19) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17:2 = "neura.fused_op"(%7) <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %31 = "neura.add"(%arg19) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20:2 = "neura.fused_op"(%6) <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %31 = "neura.add"(%arg19) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %21 = "neura.data_mov"(%20#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%20#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23:2 = "neura.fused_op"(%5) <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %31 = "neura.add"(%arg19) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %24 = "neura.data_mov"(%23#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26:2 = "neura.fused_op"(%4) <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %31 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %27 = "neura.data_mov"(%26#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.div"(%9) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %28 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %25 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %22 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %19 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg15 : memref<16xi32>) writes(%arg15 : memref<16xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg6, %dependency_write_out_3, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg6 : memref<16xi32>) [original_read_memrefs(%arg6, %arg3, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg6 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.add"(%63) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64, %65, %66, %67 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%9) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = neura.load_indexed [%arg21, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%30, %10, %11) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%29, %12, %13) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.fused_op"(%28, %37, %38) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%27, %42, %43) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%26, %47, %48) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%5) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%25, %52, %53) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:2 = "neura.fused_op"(%4) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%24, %57, %58) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%23, %31) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = "neura.add"(%63, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %40 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%arg8, %dependency_write_out_5, %arg7 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg8 : memref<16xi32>) [original_read_memrefs(%arg8, %arg6, %arg7 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg8 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.add"(%63) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64, %65, %66, %67 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%9) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = neura.load_indexed [%63, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%30, %10, %11) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%29, %12, %13) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.fused_op"(%28, %37, %38) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%27, %42, %43) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%26, %47, %48) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%5) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%25, %52, %53) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:2 = "neura.fused_op"(%4) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%24, %57, %58) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%23, %31) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = "neura.add"(%63, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %40 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%arg10, %dependency_write_out_5, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10 : memref<16xi32>) [original_read_memrefs(%arg10, %arg6, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.add"(%63) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64, %65, %66, %67 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%9) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = neura.load_indexed [%63, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%30, %10, %11) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%29, %12, %13) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.fused_op"(%28, %37, %38) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%27, %42, %43) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%26, %47, %48) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%5) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%25, %52, %53) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:2 = "neura.fused_op"(%4) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%24, %57, %58) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%23, %31) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = "neura.add"(%63, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %40 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    %dependency_read_out_10:2, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_7, %dependency_write_out_9 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg11 : memref<16xi32>) [original_read_memrefs(%arg8, %arg10 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg11 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg14, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
          %33 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%35, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12:2 = "neura.fused_op"(%10) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13 = "neura.data_mov"(%12#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%12#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15:2 = "neura.fused_op"(%9) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.data_mov"(%15#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18:2 = "neura.fused_op"(%8) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%7) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%6) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%5) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%4) <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %33 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %32 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %26 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %23 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %20 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14, %arg15 : memref<16xi32>, memref<16xi32>) writes(%arg16 : memref<16xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%arg13, %dependency_write_out_11, %arg12 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg13 : memref<16xi32>) [original_read_memrefs(%arg13, %arg11, %arg12 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg13 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.add"(%63) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64, %65, %66, %67 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%9) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %64 = neura.load_indexed [%63, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%30, %10, %11) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%29, %12, %13) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.fused_op"(%28, %37, %38) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%27, %42, %43) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%26, %47, %48) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%5) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%25, %52, %53) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:2 = "neura.fused_op"(%4) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %63 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%63, %64 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%24, %57, %58) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%arg23, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%23, %31) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %63 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = "neura.add"(%63, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %40 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

