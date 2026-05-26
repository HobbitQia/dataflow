module {
  func.func @resnet_block(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"(%2) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%arg16, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%11, %14 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%3#0, %2) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %11 = "neura.add"(%arg16) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%arg17, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.fused_op"(%4#0, %4#1, %2) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>):
          %11 = "neura.mul"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.add"(%12, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"(%3#0, %2) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %11 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%arg17, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %7 = "neura.fused_op"(%6#0, %6#1, %2) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>):
          %11 = "neura.mul"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.add"(%12, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8:2 = "neura.fused_op"(%3#0, %2) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %11 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%arg17, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %9 = "neura.fused_op"(%8#0, %8#1, %2) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>):
          %11 = "neura.mul"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.add"(%12, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2, %3#1) <{frequency = 16 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %11 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %12 = "neura.add"(%11, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<4096xi32>) dependency_write_in(%arg3 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg2 : memref<4096xi32>), original_write_memrefs(%arg3 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg9, %arg11, %arg10 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: i32, %arg14: memref<4096xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 23 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %6 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6, %7 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2:2 = "neura.fused_op"(%1#1) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "constant->fused_op:icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>):
          %6 = "neura.constant"() <{value = "%input1"}> : () -> !neura.data<i32, i1>
          %7 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %8 = "neura.sel"(%7, %arg15, %6) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %8 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%1#0, %2#0) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %6 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.icmp"(%7) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %9 = "neura.sel"(%8, %7, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %9 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%1#0, %2#0) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %6 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.icmp"(%7) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %9 = "neura.sel"(%8, %7, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %9 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%1#0, %2#0) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %6 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.icmp"(%7) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %9 = "neura.sel"(%8, %7, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %9 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %2#1 to [%1#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg9 : memref<4096xi32>) writes(%arg10 : memref<4096xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg6 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg6 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"(%2) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%arg16, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%11, %14 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%3#0, %2) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %11 = "neura.add"(%arg16) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%arg17, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.fused_op"(%4#0, %4#1, %2) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>):
          %11 = "neura.mul"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.add"(%12, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"(%3#0, %2) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %11 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%arg17, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %7 = "neura.fused_op"(%6#0, %6#1, %2) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>):
          %11 = "neura.mul"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.add"(%12, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8:2 = "neura.fused_op"(%3#0, %2) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %11 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%arg17, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %9 = "neura.fused_op"(%8#0, %8#1, %2) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>):
          %11 = "neura.mul"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.add"(%12, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2, %3#1) <{frequency = 16 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %11 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %12 = "neura.add"(%11, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_4:2, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_write_out_3, %arg7 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg8 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg7 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg8 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg9, %arg10, %arg11 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: memref<4096xi32>, %arg14: memref<4096xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %2:3 = "neura.fused_op"(%1) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %10 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%10, %11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3:3 = "neura.fused_op"(%1) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %10 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%10, %11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:3 = "neura.fused_op"(%1) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %10 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%10, %11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.fused_op"(%1, %5) <{frequency = 16 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %10 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %11 = "neura.add"(%10, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%1 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.add"(%4#1, %4#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%4#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %8 = "neura.add"(%3#1, %3#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %9 = "neura.add"(%2#1, %2#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg9, %arg10 : memref<4096xi32>, memref<4096xi32>) writes(%arg11 : memref<4096xi32>)
    }
    return
  }
}

