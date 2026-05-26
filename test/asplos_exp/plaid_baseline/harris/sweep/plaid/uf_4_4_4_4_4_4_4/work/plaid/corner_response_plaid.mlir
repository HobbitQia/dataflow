module {

  func.func @corner_response(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>) {
    %c4_i32 = arith.constant 4 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) value_inputs(%c4_i32 : i32) [original_read_memrefs(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%plaid_fused_0#2, %5, %6) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<i32, i1>, %plaid_arg2_1: !neura.data<i32, i1>, %plaid_arg2_2: !neura.data<i32, i1>):
          %7 = "neura.mul"(%plaid_arg2_0, %plaid_arg2_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %8 = "neura.mul"(%plaid_arg2_2, %plaid_arg2_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %9 = "neura.sub"(%7, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%plaid_fused_0#2, %5) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<i32, i1>, %plaid_arg3_1: !neura.data<i32, i1>):
          %10 = "neura.add"(%plaid_arg3_0, %plaid_arg3_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.mul"(%11) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.sub"(%plaid_fused_1, %plaid_fused_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %plaid_fused_3:3 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %14 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = neura.load_indexed [%plaid_arg4_1, %14 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %16 = neura.load_indexed [%plaid_arg4_1, %14 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%14, %15, %16 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %17 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_3#1, %plaid_fused_3#2, %17) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>):
          %18 = "neura.mul"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.mul"(%plaid_arg5_2, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.sub"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%20 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_3#1, %plaid_fused_3#2) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>):
          %21 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.sub"(%plaid_fused_4, %plaid_fused_5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%plaid_fused_0#0, %plaid_fused_3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %plaid_fused_6:3 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<index, i1>, %plaid_arg7_1: !neura.data<index, i1>):
          %25 = "neura.add"(%plaid_arg7_0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%plaid_arg7_1, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = neura.load_indexed [%plaid_arg7_1, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %28 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_6#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_7 = "neura.fused_op"(%plaid_fused_6#1, %plaid_fused_6#2, %28) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<i32, i1>, %plaid_arg8_1: !neura.data<i32, i1>, %plaid_arg8_2: !neura.data<i32, i1>):
          %29 = "neura.mul"(%plaid_arg8_0, %plaid_arg8_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.mul"(%plaid_arg8_2, %plaid_arg8_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.sub"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%plaid_fused_6#1, %plaid_fused_6#2) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<i32, i1>, %plaid_arg9_1: !neura.data<i32, i1>):
          %32 = "neura.add"(%plaid_arg9_0, %plaid_arg9_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.sub"(%plaid_fused_7, %plaid_fused_8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %35 to [%plaid_fused_0#0, %plaid_fused_6#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %plaid_fused_9:3 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %36 = "neura.add"(%plaid_arg10_0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%plaid_arg10_1, %36 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = neura.load_indexed [%plaid_arg10_1, %36 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %39 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_9#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%plaid_fused_9#1, %plaid_fused_9#2, %39) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<i32, i1>, %plaid_arg11_1: !neura.data<i32, i1>, %plaid_arg11_2: !neura.data<i32, i1>):
          %40 = "neura.mul"(%plaid_arg11_0, %plaid_arg11_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.mul"(%plaid_arg11_2, %plaid_arg11_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.sub"(%40, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_9#1, %plaid_fused_9#2) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>):
          %43 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = "neura.mul"(%44) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%plaid_fused_10, %plaid_fused_11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %46 to [%plaid_fused_0#0, %plaid_fused_9#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg4, %arg5, %arg6 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return
  }

}
