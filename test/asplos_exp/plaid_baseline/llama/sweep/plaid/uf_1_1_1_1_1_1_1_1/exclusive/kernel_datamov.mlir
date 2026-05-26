module {
  func.func @ffn_act(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_out:counter->load_indexed->load_indexed"}> ({
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = neura.load_indexed [%7 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%7, %8, %9 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.mul"(%3, %4) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @qk_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_exp(%arg0: memref<16xi32>, %arg1: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg1 : memref<16xi32>) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg1 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<16xi32>, %arg5: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:counter->load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %8 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.add"(%3) {latency = 1 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg5: memref<16xi32>, %arg6: i32):
        %2:2 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:counter->load_indexed->div"}> ({
          %5 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %6 = neura.load_indexed [%5 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %7 = "neura.div"(%6) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%5, %7 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %4 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

