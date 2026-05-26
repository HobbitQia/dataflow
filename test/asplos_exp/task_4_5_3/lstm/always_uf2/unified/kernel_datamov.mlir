module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:9, %dependency_write_out:4 = taskflow.task @fused_sibling dependency_read_in(%arg10, %arg0, %arg2, %arg11, %arg3, %arg12, %arg4, %arg13, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2, %arg11, %arg0, %arg3, %arg12, %arg0, %arg4, %arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 2 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %44 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 2 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %45 = "neura.add"(%44) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%44) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = "neura.add"(%44) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%44, %45, %46, %47 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%7) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>):
          %44 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %45 = neura.load_indexed [%44, %arg39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %48 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %49 = "neura.add"(%48, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%44, %49 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%26, %6) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%25, %9) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%24, %5) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%23, %8) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %4) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %38 = "neura.fused_op"(%16, %10) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        %40 = "neura.add"(%3) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.fused_op"(%13, %41) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %43 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_0:9, %dependency_write_out_1:4 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out#0, %arg1, %arg6, %dependency_write_out#1, %arg7, %dependency_write_out#2, %arg8, %dependency_write_out#3, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out#0, %dependency_write_out#1, %dependency_write_out#2, %dependency_write_out#3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6, %arg11, %arg1, %arg7, %arg12, %arg1, %arg8, %arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 2 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %44 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 2 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %45 = "neura.add"(%44) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%44) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = "neura.add"(%44) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%44, %45, %46, %47 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%7) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>):
          %44 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %45 = neura.load_indexed [%44, %arg39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %48 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %49 = "neura.add"(%48, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%44, %49 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%26, %6) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%25, %9) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%24, %5) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%23, %8) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %4) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %38 = "neura.fused_op"(%16, %10) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        %40 = "neura.add"(%3) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.fused_op"(%13, %41) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %44 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %48 = "neura.add"(%47, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %43 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_2:5, %dependency_write_out_3 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_1#1, %arg14, %dependency_write_out_1#0, %dependency_write_out_1#3, %dependency_write_out_1#2 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 2 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %22 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 2 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.fused_op"(%6) <{frequency = 18 : i64, pattern_id = 8 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %22 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%5) <{frequency = 18 : i64, pattern_id = 8 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %22 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11:2 = "neura.fused_op"(%10, %8) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "add->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %22 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = "neura.mul"(%22, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22, %23 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%4, %14) <{frequency = 38 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %22 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %17 = "neura.mul"(%13, %12) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19:2 = "neura.fused_op"(%2, %18) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %22 = "neura.add"(%arg30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22, %24 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

