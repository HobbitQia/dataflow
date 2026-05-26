module {
  func.func @resnet_block(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c4095 = arith.constant {latency = 1 : i32} 4095 : index
    %c0_i32 = arith.constant {latency = 1 : i32} 0 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %6 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %7 = taskflow.counter parent(%6 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %8:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:counter->fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:load_indexed->add"}> ({
          %15 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %16 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%15, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%15, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = neura.load_indexed [%20 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%21, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.add"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%15, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %28 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%27, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %31 = "neura.add"(%30, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.add"(%32, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%15, %25, %31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %9 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%8#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%8#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%8#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<4096xi32>) dependency_write_in(%arg3 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg2 : memref<4096xi32>), original_write_memrefs(%arg3 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: i32):
      %6 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : index
      neura.kernel inputs(%arg9, %arg11, %arg10 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: i32, %arg14: memref<4096xi32>):
        %7:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %22 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : !neura.data<index, i1>
          %23 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%22) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22, %23, %24, %25 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %8 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%7#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%7#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13:2 = "neura.fused_op"(%10) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "constant->fused_op:icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>):
          %22 = "neura.constant"() <{value = "%input1"}> : () -> !neura.data<i32, i1>
          %23 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %24 = "neura.sel"(%23, %arg15, %22) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22, %24 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %14 = "neura.data_mov"(%13#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%13#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17:2 = "neura.fused_op"(%9, %15) <{frequency = 2 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %22 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.icmp"(%23) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %25 = "neura.sel"(%24, %23, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.fused_op"(%12, %14) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %22 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %23 = "neura.sel"(%22, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %19 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg9 : memref<4096xi32>) writes(%arg10 : memref<4096xi32>)
    }
    %0 = memref.load %dependency_write_out[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %1 = arith.cmpi sgt, %0, %c0_i32 {latency = 1 : i32} : i32
    %2 = arith.select %1, %0, %c0_i32 {latency = 1 : i32} : i32
    memref.store %2, %dependency_write_out_1[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg6 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg6 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %6 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %7 = taskflow.counter parent(%6 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %8:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:counter->fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:load_indexed->add"}> ({
          %15 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %16 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%15, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%15, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = neura.load_indexed [%20 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%21, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.add"(%24, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%15, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %28 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%27, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %31 = "neura.add"(%30, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.add"(%32, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%15, %25, %31, %33 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %9 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%8#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%8#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%8#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_4:2, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_write_out_3, %arg7 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg8 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg7 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg8 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: memref<4096xi32>):
      %6 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : index
      neura.kernel inputs(%arg9, %arg10, %arg11 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: memref<4096xi32>, %arg14: memref<4096xi32>):
        %7:3 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:counter->add->fused_op:load_indexed->fused_op:load_indexed->add"}> ({
          %20 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%20, %21, %24 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %8 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%7#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%7#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%7#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%10) <{frequency = 3 : i64, pattern_id = 12 : i64, pattern_name = "load_indexed->fused_op:load_indexed->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %20 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %15 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%16) <{frequency = 3 : i64, pattern_id = 12 : i64, pattern_name = "load_indexed->fused_op:load_indexed->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %20 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %18 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg9, %arg10 : memref<4096xi32>, memref<4096xi32>) writes(%arg11 : memref<4096xi32>)
    }
    %3 = memref.load %dependency_write_out_3[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %4 = memref.load %dependency_read_out_4#1[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %5 = arith.addi %3, %4 {latency = 1 : i32} : i32
    memref.store %5, %dependency_write_out_5[%c4095] {latency = 1 : i32} : memref<4096xi32>
    return {latency = 1 : i32}
  }
}

