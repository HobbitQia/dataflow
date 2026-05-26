module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:9, %dependency_write_out:4 = taskflow.task @fused_sibling dependency_read_in(%arg10, %arg0, %arg2, %arg11, %arg3, %arg12, %arg4, %arg13, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2, %arg11, %arg0, %arg3, %arg12, %arg0, %arg4, %arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.fused_op"(%8, %9) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%12, %13) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.fused_op"(%16, %17) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %19) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %15) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %11) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.fused_op"(%32, %7) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %34 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_0:9, %dependency_write_out_1:4 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out#0, %arg1, %arg6, %dependency_write_out#1, %arg7, %dependency_write_out#2, %arg8, %dependency_write_out#3, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out#0, %dependency_write_out#1, %dependency_write_out#2, %dependency_write_out#3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6, %arg11, %arg1, %arg7, %arg12, %arg1, %arg8, %arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.fused_op"(%8, %9) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%12, %13) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.fused_op"(%16, %17) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %36 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.mul"(%37, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20, %19) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %22 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %15) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %11) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.fused_op"(%32, %7) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<i32, i1>):
          %36 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %34 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_2:5, %dependency_write_out_3 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_1#1, %arg14, %dependency_write_out_1#0, %dependency_write_out_1#3, %dependency_write_out_1#2 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.fused_op"(%2) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%15, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %4 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%5) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %14 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %15 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%15, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%7, %4) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "add->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %14 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %15 = "neura.mul"(%14, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%15 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%10, %9) <{frequency = 21 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %14 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%15 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

