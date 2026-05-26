module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg10, %arg0, %arg2 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10 : memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg11, %dependency_read_out#1, %arg3 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg11 : memref<16xi32>) [original_read_memrefs(%arg11, %arg0, %arg3 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg11 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg12, %dependency_read_out#1, %arg4 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg12 : memref<16xi32>) [original_read_memrefs(%arg12, %arg0, %arg4 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg12 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg13, %dependency_read_out#1, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg13 : memref<16xi32>) [original_read_memrefs(%arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg13 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%dependency_write_out, %arg1, %arg6 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out : memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%dependency_write_out_1, %dependency_read_out_6#1, %arg7 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out_1 : memref<16xi32>) [original_read_memrefs(%arg11, %arg1, %arg7 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg11 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_10:3, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_3, %dependency_read_out_6#1, %arg8 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out_3 : memref<16xi32>) [original_read_memrefs(%arg12, %arg1, %arg8 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg12 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%dependency_write_out_5, %dependency_read_out_6#1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out_5 : memref<16xi32>) [original_read_memrefs(%arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg13 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"() <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
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
        %9 = "neura.fused_op"(%8, %6) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11, %5) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%14, %4) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %21 = "neura.fused_op"(%20, %7) <{frequency = 32 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %24 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_14:5, %dependency_write_out_15 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_9, %arg14, %dependency_write_out_7, %dependency_write_out_13, %dependency_write_out_11 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %27 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %28 = "neura.add"(%27) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%27, %28 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8) <{frequency = 34 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %27 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %28 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%29 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11:3 = "neura.fused_op"(%7, %10) <{frequency = 2 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:add->mul->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %27 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %28 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.mul"(%30, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.mul"(%30, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30, %31, %32 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%11#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16:2 = "neura.fused_op"(%13, %6) <{frequency = 2 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %27 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg31) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28, %30 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %17 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%16#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19:2 = "neura.fused_op"(%12, %5) <{frequency = 2 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %27 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg31) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28, %30 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%4, %14) <{frequency = 72 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %27 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %28 = "neura.mul"(%27, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%28 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%2, %15) <{frequency = 19 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %27 = "neura.add"(%arg30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %18 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

