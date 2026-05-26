module {
  func.func @llama_attention_ffn(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: memref<1xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16x16xi32>, %arg13: memref<16xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %c1_i32 = arith.constant {latency = 1 : i32} 1 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:4 = "neura.fused_op"() <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %24 = "neura.add"(%23) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = "neura.add"(%23) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%23) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%23, %24, %25, %26 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8:2 = "neura.fused_op"(%6) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %23 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %28 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%8#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%15, %5) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = neura.load_indexed [%arg22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%14, %4) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = neura.load_indexed [%arg22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %18 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%10, %7) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = neura.load_indexed [%arg22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<16xi32>) dependency_write_in(%arg3 : memref<16xi32>) value_inputs(%c1_i32 : i32) [original_read_memrefs(%arg2 : memref<16xi32>), original_write_memrefs(%arg3 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg14, %arg16, %arg15 : memref<16xi32>, i32, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<16xi32>, %arg18: i32, %arg19: memref<16xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 11 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:counter->add->fused_op:load_indexed->mul"}> ({
          %23 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %24 = "neura.add"(%23) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %24, %26 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%7) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:load_indexed->mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%24) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%25 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11:2 = "neura.fused_op"(%5) <{frequency = 14 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %23 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%4) <{frequency = 14 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %23 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.add"(%8) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = "neura.add"(%16) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.add"(%13) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14 : memref<16xi32>) writes(%arg15 : memref<16xi32>)
    }
    %0 = memref.load %arg4[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out_1 : memref<16xi32>) dependency_write_in(%dependency_write_out_1 : memref<16xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg3 : memref<16xi32>), original_write_memrefs(%arg3 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg15, %arg16 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<16xi32>, %arg18: i32):
        %2:4 = "neura.fused_op"() <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:add->load_indexed->div"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.add"(%17) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.div"(%20) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %18, %19, %21 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9:2 = "neura.fused_op"(%5) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%9#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12:2 = "neura.fused_op"(%4) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13 = "neura.data_mov"(%12#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%12#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.div"(%6) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %8 to [%7 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg15 : memref<16xi32>) writes(%arg15 : memref<16xi32>)
    }
    %dependency_read_out_4:7, %dependency_write_out_5:2 = taskflow.task @fused_pc dependency_read_in(%arg6, %dependency_write_out_3, %arg5, %arg8, %arg7, %arg10, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg6, %arg8, %arg10 : memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg6, %arg3, %arg5, %arg8, %arg6, %arg7, %arg10, %arg6, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg6, %arg8, %arg10 : memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>, %arg18: memref<16x16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg21, %arg15, %arg16, %arg22, %arg18, %arg23, %arg20 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16x16xi32>, %arg27: memref<16xi32>, %arg28: memref<16x16xi32>, %arg29: memref<16xi32>, %arg30: memref<16x16xi32>):
        %3:3 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %54 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %55 = "neura.add"(%54) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %56 = "neura.add"(%54) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%54, %55, %56 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13:2 = "neura.fused_op"(%11) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>):
          %54 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %55 = neura.load_indexed [%arg31, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %56 = neura.load_indexed [%arg31 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %57 = "neura.mul"(%56, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %58 = neura.load_indexed [%54 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = "neura.add"(%58, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%54, %59 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%10, %29, %37) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = "neura.add"(%arg31) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%arg32, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %56 = "neura.mul"(%arg33, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %57 = neura.load_indexed [%arg32 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %58 = "neura.add"(%57, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%9, %28, %36) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = "neura.add"(%arg31) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%arg32, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %56 = "neura.mul"(%arg33, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %57 = neura.load_indexed [%arg32 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %58 = "neura.add"(%57, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.fused_op"(%8, %27, %35) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = "neura.add"(%arg31) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%arg32, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %56 = "neura.mul"(%arg33, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %57 = neura.load_indexed [%arg32 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %58 = "neura.add"(%57, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%7, %26, %34) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = "neura.add"(%arg31) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%arg32, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %56 = "neura.mul"(%arg33, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %57 = neura.load_indexed [%arg32 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %58 = "neura.add"(%57, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%6, %25, %33) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = "neura.add"(%arg31) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%arg32, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %56 = "neura.mul"(%arg33, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %57 = neura.load_indexed [%arg32 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %58 = "neura.add"(%57, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.fused_op"(%24, %5, %32) <{frequency = 17 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = neura.load_indexed [%arg31, %arg32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %55 = "neura.mul"(%arg33, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %56 = neura.load_indexed [%arg31 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %57 = "neura.add"(%56, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%23, %4, %31) <{frequency = 17 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = neura.load_indexed [%arg31, %arg32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %55 = "neura.mul"(%arg33, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %56 = neura.load_indexed [%arg31 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %57 = "neura.add"(%56, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %49 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        %52 = "neura.fused_op"(%21, %12, %30) <{frequency = 17 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg31: !neura.data<index, i1>, %arg32: !neura.data<index, i1>, %arg33: !neura.data<i32, i1>):
          %54 = neura.load_indexed [%arg31, %arg32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %55 = "neura.mul"(%arg33, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %56 = neura.load_indexed [%arg31 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %57 = "neura.add"(%56, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %47 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %43 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %41 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %39 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg22, %arg23 : memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_6:2, %dependency_write_out_7 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_5#0, %dependency_write_out_5#1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg11 : memref<16xi32>) [original_read_memrefs(%arg8, %arg10 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg11 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg14, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 22 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %29 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %30 = "neura.add"(%29) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%29, %30 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8) <{frequency = 13 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %29 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %30 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %31 = "neura.mul"(%30, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%6) <{frequency = 13 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %29 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %30 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %31 = "neura.mul"(%30, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %10 to [%7 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%13) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%16, %17) <{frequency = 42 : i64, pattern_id = 6 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<i32, i1>):
          %29 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%13) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %19 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.add"(%3) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%22 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = "neura.data_mov"(%21) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%24, %25) <{frequency = 42 : i64, pattern_id = 6 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<i32, i1>):
          %29 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%21) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %27 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14, %arg15 : memref<16xi32>, memref<16xi32>) writes(%arg16 : memref<16xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_7 dependency_read_in(%arg13, %dependency_write_out_7, %arg12 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg13 : memref<16xi32>) [original_read_memrefs(%arg13, %arg11, %arg12 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg13 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16x16xi32>, %arg17: memref<16xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16x16xi32>):
        %3:4 = "neura.fused_op"() <{frequency = 7 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %24 = "neura.add"(%23) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = "neura.add"(%23) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%23) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%23, %24, %25, %26 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8:2 = "neura.fused_op"(%6) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "counter->fused_op:load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>):
          %23 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %25 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%27, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %28 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%8#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%15, %5) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = neura.load_indexed [%arg22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%14, %4) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = neura.load_indexed [%arg22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %18 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%10, %7) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>):
          %23 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %24 = neura.load_indexed [%arg22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg17 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

