module {
  func.func @qk_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %67 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %68 = "neura.add"(%67) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %70 = "neura.add"(%67) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68, %69, %70, %71 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %11, %12) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%18, %13, %14) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%10) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %22, %23) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%30, %28, %29) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %34, %35) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.fused_op"(%42, %40, %41) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %46, %47) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%4, %53) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %68 = "neura.mul"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%56, %55) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = "neura.add"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %58 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%60 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %44 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%62 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %32 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%65 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%66 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_exp(%arg0: memref<16xi32>, %arg1: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg1 : memref<16xi32>) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg1 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<16xi32>, %arg5: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3:2 = "neura.fused_op"(%2) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7:2 = "neura.fused_op"(%6) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%7#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%10) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15:2 = "neura.fused_op"(%14) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.data_mov"(%15#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:2 = "neura.fused_op"(%18) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23:2 = "neura.fused_op"(%22) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %24 = "neura.data_mov"(%23#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27:2 = "neura.fused_op"(%26) <{frequency = 42 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = "neura.add"(%arg6) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%30) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%32) {latency = 1 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %34 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %25 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_norm(%arg0: memref<16xi32>, %arg1: memref<1xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %0 = memref.load %arg1[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg0 : memref<16xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg0 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg5: memref<16xi32>, %arg6: i32):
        %2:2 = "neura.fused_op"() <{frequency = 94 : i64, pattern_id = 2 : i64, pattern_name = "counter->load_indexed"}> ({
          %49 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12:2 = "neura.fused_op"(%10) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13 = "neura.data_mov"(%12#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%12#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15:2 = "neura.fused_op"(%9) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.data_mov"(%15#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%5) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%4) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %49 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%49, %50 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.div"(%11) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %34 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = "neura.div"(%32) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %36 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %37 = "neura.div"(%29) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.div"(%26) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = "neura.div"(%23) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %42 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %43 = "neura.div"(%20) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.div"(%17) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %46 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = "neura.div"(%14) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %48 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @sv_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %67 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %68 = "neura.add"(%67) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %70 = "neura.add"(%67) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68, %69, %70, %71 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %11, %12) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%18, %13, %14) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%10) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %22, %23) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%30, %28, %29) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %34, %35) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.fused_op"(%42, %40, %41) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %46, %47) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%5, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%4, %53) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %68 = "neura.mul"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%56, %55) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = "neura.add"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %58 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%60 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %44 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%62 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %32 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%65 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%66 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_gate(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %67 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %68 = "neura.add"(%67) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %70 = "neura.add"(%67) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68, %69, %70, %71 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %11, %12) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%18, %13, %14) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%10) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %22, %23) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%30, %28, %29) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %34, %35) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.fused_op"(%42, %40, %41) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %46, %47) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%4, %53) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %68 = "neura.mul"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%56, %55) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = "neura.add"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %58 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%60 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %44 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%62 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %32 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%65 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%66 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_up(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %67 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %68 = "neura.add"(%67) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %70 = "neura.add"(%67) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68, %69, %70, %71 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %11, %12) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%18, %13, %14) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%10) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %22, %23) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%30, %28, %29) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %34, %35) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.fused_op"(%42, %40, %41) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %46, %47) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%4, %53) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %68 = "neura.mul"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%56, %55) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = "neura.add"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %58 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%60 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %44 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%62 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %32 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%65 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%66 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_act(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3:2 = "neura.fused_op"(%2) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7:2 = "neura.fused_op"(%6) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%7#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%10) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15:2 = "neura.fused_op"(%14) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.data_mov"(%15#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:2 = "neura.fused_op"(%18) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23:2 = "neura.fused_op"(%22) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %24 = "neura.data_mov"(%23#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27:2 = "neura.fused_op"(%26) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %37 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37, %40 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%30 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %37 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %35 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %25 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_down(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:5 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
          %67 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %68 = "neura.add"(%67) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %70 = "neura.add"(%67) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68, %69, %70, %71 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %11, %12) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%18, %13, %14) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%10) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %22, %23) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%30, %28, %29) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%8) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %34, %35) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%7) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.fused_op"(%42, %40, %41) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%6) <{frequency = 98 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %67 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%67, %68 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %46, %47) <{frequency = 35 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%arg12, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%67, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%4, %53) <{frequency = 112 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %68 = "neura.mul"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%56, %55) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %67 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = "neura.add"(%67, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %58 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%60 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %44 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%62 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %32 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%65 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%66 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

