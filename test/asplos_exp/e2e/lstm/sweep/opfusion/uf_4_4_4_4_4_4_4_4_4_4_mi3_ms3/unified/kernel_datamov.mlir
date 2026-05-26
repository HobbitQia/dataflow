module {
  func.func @i_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @f_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @o_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @g_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @i_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @f_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @o_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @g_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %24 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %25 = "neura.add"(%24) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%24) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%24) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%24, %25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %16 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %13 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @cell_update(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:4, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg4 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg4 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg5: memref<16xi32>, %arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg5, %arg6, %arg7, %arg8, %arg9 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>):
        %1:4 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
          %28 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %29 = "neura.add"(%28) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %30 = "neura.add"(%28) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%29 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%29 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28, %29, %30, %33 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%1#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%1#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%1#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%7, %11) <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %28 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %29 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%5) <{frequency = 10 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %28 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %30 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %31 = "neura.mul"(%30, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28, %31 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%16, %17) <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %28 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %29 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.fused_op"(%4) <{frequency = 40 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %28 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %29 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%3, %21) <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %28 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %29 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%6 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %24 = "neura.fused_op"(%10) <{frequency = 40 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %28 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %29 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%9, %25) <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %28 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %29 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.store_indexed %19 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg5, %arg6, %arg7, %arg8 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg9 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @output_gate(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:counter->add->fused_op:load_indexed->mul"}> ({
          %19 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %20 = "neura.add"(%19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %20, %22 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9:2 = "neura.fused_op"(%5) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:load_indexed->mul->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %19 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %23 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%9#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12:2 = "neura.fused_op"(%4) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:load_indexed->mul->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %19 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %23 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13 = "neura.data_mov"(%12#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%12#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%7) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%19, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%3, %8) <{frequency = 92 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %19 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%19, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%20 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%6 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

