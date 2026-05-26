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



  func.func @gaussian_blur(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %22 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%14) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%21) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_0, %26, %plaid_fused_1, %27) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %30 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_4, %25, %28, %plaid_fused_2) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>, %plaid_arg6_2: !neura.data<i32, i1>, %plaid_arg6_3: !neura.data<i32, i1>):
          %33 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %plaid_arg6_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%34, %plaid_arg6_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%plaid_fused_5, %29, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<i32, i1>, %plaid_arg7_1: !neura.data<i32, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
          %36 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %40 = "neura.add"(%plaid_arg8_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %45 = "neura.add"(%plaid_arg9_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%2, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %53 = "neura.add"(%plaid_arg10_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = "neura.add"(%plaid_arg10_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%53, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%55 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%56, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %58 = "neura.add"(%plaid_arg11_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = "neura.add"(%plaid_arg11_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %60 = neura.load_indexed [%58, %59 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%50) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.mul"(%44) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%49) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%52) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%57) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_7, %62, %plaid_fused_8, %63) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>, %plaid_arg12_2: !neura.data<i32, i1>, %plaid_arg12_3: !neura.data<i32, i1>):
          %66 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%66, %plaid_arg12_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%67, %plaid_arg12_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%plaid_fused_11, %61, %64, %plaid_fused_9) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<i32, i1>, %plaid_arg13_1: !neura.data<i32, i1>, %plaid_arg13_2: !neura.data<i32, i1>, %plaid_arg13_3: !neura.data<i32, i1>):
          %69 = "neura.add"(%plaid_arg13_0, %plaid_arg13_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%69, %plaid_arg13_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%70, %plaid_arg13_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%plaid_fused_12, %65, %plaid_fused_10) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<i32, i1>, %plaid_arg14_1: !neura.data<i32, i1>, %plaid_arg14_2: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg14_0, %plaid_arg14_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %plaid_arg14_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.div"(%73) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_13 to [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_14 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg15_0: !neura.data<index, i1>, %plaid_arg15_1: !neura.data<index, i1>):
          %76 = "neura.add"(%plaid_arg15_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %77 = "neura.add"(%plaid_arg15_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%78 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = neura.load_indexed [%79, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_15 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg16_0: !neura.data<index, i1>, %plaid_arg16_1: !neura.data<index, i1>):
          %81 = "neura.add"(%plaid_arg16_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %82 = "neura.add"(%plaid_arg16_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %84 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_16 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg17_0: !neura.data<index, i1>, %plaid_arg17_1: !neura.data<index, i1>):
          %89 = "neura.add"(%plaid_arg17_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %90 = "neura.add"(%plaid_arg17_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%92, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_17 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg18_0: !neura.data<index, i1>, %plaid_arg18_1: !neura.data<index, i1>):
          %94 = "neura.add"(%plaid_arg18_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %95 = "neura.add"(%plaid_arg18_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %96 = neura.load_indexed [%94, %95 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%96 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.mul"(%86) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%80) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.mul"(%85) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.mul"(%88) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.mul"(%93) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_18 = "neura.fused_op"(%plaid_fused_14, %98, %plaid_fused_15, %99) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg19_0: !neura.data<i32, i1>, %plaid_arg19_1: !neura.data<i32, i1>, %plaid_arg19_2: !neura.data<i32, i1>, %plaid_arg19_3: !neura.data<i32, i1>):
          %102 = "neura.add"(%plaid_arg19_0, %plaid_arg19_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %103 = "neura.add"(%102, %plaid_arg19_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.add"(%103, %plaid_arg19_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%104 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_19 = "neura.fused_op"(%plaid_fused_18, %97, %100, %plaid_fused_16) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg20_0: !neura.data<i32, i1>, %plaid_arg20_1: !neura.data<i32, i1>, %plaid_arg20_2: !neura.data<i32, i1>, %plaid_arg20_3: !neura.data<i32, i1>):
          %105 = "neura.add"(%plaid_arg20_0, %plaid_arg20_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%105, %plaid_arg20_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%106, %plaid_arg20_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%107 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_20 = "neura.fused_op"(%plaid_fused_19, %101, %plaid_fused_17) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg21_0: !neura.data<i32, i1>, %plaid_arg21_1: !neura.data<i32, i1>, %plaid_arg21_2: !neura.data<i32, i1>):
          %108 = "neura.add"(%plaid_arg21_0, %plaid_arg21_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%108, %plaid_arg21_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.div"(%109) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_20 to [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %111 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_21 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg22_0: !neura.data<index, i1>, %plaid_arg22_1: !neura.data<index, i1>):
          %112 = "neura.add"(%plaid_arg22_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = "neura.add"(%plaid_arg22_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %114 = neura.load_indexed [%112, %113 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%114 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %115 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = neura.load_indexed [%115, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_22 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg23_0: !neura.data<index, i1>, %plaid_arg23_1: !neura.data<index, i1>):
          %117 = "neura.add"(%plaid_arg23_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %118 = "neura.add"(%plaid_arg23_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %119 = neura.load_indexed [%117, %118 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%119 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %120 = "neura.add"(%111) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = neura.load_indexed [%2, %120 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%2, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.add"(%111) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%2, %123 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_23 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg24_0: !neura.data<index, i1>, %plaid_arg24_1: !neura.data<index, i1>):
          %125 = "neura.add"(%plaid_arg24_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %126 = "neura.add"(%plaid_arg24_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%125, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%127 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %128 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_24 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg25_0: !neura.data<index, i1>, %plaid_arg25_1: !neura.data<index, i1>):
          %130 = "neura.add"(%plaid_arg25_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = "neura.add"(%plaid_arg25_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %132 = neura.load_indexed [%130, %131 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%132 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.mul"(%122) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.mul"(%116) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.mul"(%121) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.mul"(%124) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.mul"(%129) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_25 = "neura.fused_op"(%plaid_fused_21, %134, %plaid_fused_22, %135) <{frequency = 1 : i64, pattern_id = 25 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg26_0: !neura.data<i32, i1>, %plaid_arg26_1: !neura.data<i32, i1>, %plaid_arg26_2: !neura.data<i32, i1>, %plaid_arg26_3: !neura.data<i32, i1>):
          %138 = "neura.add"(%plaid_arg26_0, %plaid_arg26_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %139 = "neura.add"(%138, %plaid_arg26_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %140 = "neura.add"(%139, %plaid_arg26_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%140 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_26 = "neura.fused_op"(%plaid_fused_25, %133, %136, %plaid_fused_23) <{frequency = 1 : i64, pattern_id = 26 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg27_0: !neura.data<i32, i1>, %plaid_arg27_1: !neura.data<i32, i1>, %plaid_arg27_2: !neura.data<i32, i1>, %plaid_arg27_3: !neura.data<i32, i1>):
          %141 = "neura.add"(%plaid_arg27_0, %plaid_arg27_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %142 = "neura.add"(%141, %plaid_arg27_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %143 = "neura.add"(%142, %plaid_arg27_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%143 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_27 = "neura.fused_op"(%plaid_fused_26, %137, %plaid_fused_24) <{frequency = 1 : i64, pattern_id = 27 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg28_0: !neura.data<i32, i1>, %plaid_arg28_1: !neura.data<i32, i1>, %plaid_arg28_2: !neura.data<i32, i1>):
          %144 = "neura.add"(%plaid_arg28_0, %plaid_arg28_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %145 = "neura.add"(%144, %plaid_arg28_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %146 = "neura.div"(%145) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%146 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_27 to [%2, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg1 : memref<64x64xi32>) dependency_write_in(%arg4 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 28 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 29 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 30 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 31 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %22 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%14) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%21) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_0, %26, %plaid_fused_1, %27) <{frequency = 1 : i64, pattern_id = 32 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %30 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_4, %25, %28, %plaid_fused_2) <{frequency = 1 : i64, pattern_id = 33 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>, %plaid_arg6_2: !neura.data<i32, i1>, %plaid_arg6_3: !neura.data<i32, i1>):
          %33 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %plaid_arg6_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%34, %plaid_arg6_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%plaid_fused_5, %29, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 34 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<i32, i1>, %plaid_arg7_1: !neura.data<i32, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
          %36 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 35 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %40 = "neura.add"(%plaid_arg8_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 36 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %45 = "neura.add"(%plaid_arg9_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%2, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 37 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %53 = "neura.add"(%plaid_arg10_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = "neura.add"(%plaid_arg10_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%53, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%55 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%56, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 38 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %58 = "neura.add"(%plaid_arg11_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = "neura.add"(%plaid_arg11_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %60 = neura.load_indexed [%58, %59 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%50) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.mul"(%44) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%49) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%52) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%57) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_7, %62, %plaid_fused_8, %63) <{frequency = 1 : i64, pattern_id = 39 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>, %plaid_arg12_2: !neura.data<i32, i1>, %plaid_arg12_3: !neura.data<i32, i1>):
          %66 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%66, %plaid_arg12_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%67, %plaid_arg12_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%plaid_fused_11, %61, %64, %plaid_fused_9) <{frequency = 1 : i64, pattern_id = 40 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<i32, i1>, %plaid_arg13_1: !neura.data<i32, i1>, %plaid_arg13_2: !neura.data<i32, i1>, %plaid_arg13_3: !neura.data<i32, i1>):
          %69 = "neura.add"(%plaid_arg13_0, %plaid_arg13_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%69, %plaid_arg13_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%70, %plaid_arg13_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%plaid_fused_12, %65, %plaid_fused_10) <{frequency = 1 : i64, pattern_id = 41 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<i32, i1>, %plaid_arg14_1: !neura.data<i32, i1>, %plaid_arg14_2: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg14_0, %plaid_arg14_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %plaid_arg14_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.div"(%73) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_13 to [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_14 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 42 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg15_0: !neura.data<index, i1>, %plaid_arg15_1: !neura.data<index, i1>):
          %76 = "neura.add"(%plaid_arg15_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %77 = "neura.add"(%plaid_arg15_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%78 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = neura.load_indexed [%79, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_15 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 43 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg16_0: !neura.data<index, i1>, %plaid_arg16_1: !neura.data<index, i1>):
          %81 = "neura.add"(%plaid_arg16_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %82 = "neura.add"(%plaid_arg16_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %84 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_16 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 44 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg17_0: !neura.data<index, i1>, %plaid_arg17_1: !neura.data<index, i1>):
          %89 = "neura.add"(%plaid_arg17_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %90 = "neura.add"(%plaid_arg17_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%92, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_17 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 45 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg18_0: !neura.data<index, i1>, %plaid_arg18_1: !neura.data<index, i1>):
          %94 = "neura.add"(%plaid_arg18_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %95 = "neura.add"(%plaid_arg18_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %96 = neura.load_indexed [%94, %95 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%96 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.mul"(%86) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%80) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.mul"(%85) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.mul"(%88) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.mul"(%93) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_18 = "neura.fused_op"(%plaid_fused_14, %98, %plaid_fused_15, %99) <{frequency = 1 : i64, pattern_id = 46 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg19_0: !neura.data<i32, i1>, %plaid_arg19_1: !neura.data<i32, i1>, %plaid_arg19_2: !neura.data<i32, i1>, %plaid_arg19_3: !neura.data<i32, i1>):
          %102 = "neura.add"(%plaid_arg19_0, %plaid_arg19_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %103 = "neura.add"(%102, %plaid_arg19_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.add"(%103, %plaid_arg19_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%104 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_19 = "neura.fused_op"(%plaid_fused_18, %97, %100, %plaid_fused_16) <{frequency = 1 : i64, pattern_id = 47 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg20_0: !neura.data<i32, i1>, %plaid_arg20_1: !neura.data<i32, i1>, %plaid_arg20_2: !neura.data<i32, i1>, %plaid_arg20_3: !neura.data<i32, i1>):
          %105 = "neura.add"(%plaid_arg20_0, %plaid_arg20_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%105, %plaid_arg20_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%106, %plaid_arg20_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%107 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_20 = "neura.fused_op"(%plaid_fused_19, %101, %plaid_fused_17) <{frequency = 1 : i64, pattern_id = 48 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg21_0: !neura.data<i32, i1>, %plaid_arg21_1: !neura.data<i32, i1>, %plaid_arg21_2: !neura.data<i32, i1>):
          %108 = "neura.add"(%plaid_arg21_0, %plaid_arg21_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%108, %plaid_arg21_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.div"(%109) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_20 to [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %111 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_21 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 49 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg22_0: !neura.data<index, i1>, %plaid_arg22_1: !neura.data<index, i1>):
          %112 = "neura.add"(%plaid_arg22_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = "neura.add"(%plaid_arg22_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %114 = neura.load_indexed [%112, %113 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%114 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %115 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = neura.load_indexed [%115, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_22 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 50 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg23_0: !neura.data<index, i1>, %plaid_arg23_1: !neura.data<index, i1>):
          %117 = "neura.add"(%plaid_arg23_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %118 = "neura.add"(%plaid_arg23_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %119 = neura.load_indexed [%117, %118 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%119 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %120 = "neura.add"(%111) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = neura.load_indexed [%2, %120 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%2, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.add"(%111) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%2, %123 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_23 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 51 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg24_0: !neura.data<index, i1>, %plaid_arg24_1: !neura.data<index, i1>):
          %125 = "neura.add"(%plaid_arg24_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %126 = "neura.add"(%plaid_arg24_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%125, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%127 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %128 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_24 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 52 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg25_0: !neura.data<index, i1>, %plaid_arg25_1: !neura.data<index, i1>):
          %130 = "neura.add"(%plaid_arg25_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = "neura.add"(%plaid_arg25_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %132 = neura.load_indexed [%130, %131 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%132 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.mul"(%122) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.mul"(%116) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.mul"(%121) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.mul"(%124) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.mul"(%129) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_25 = "neura.fused_op"(%plaid_fused_21, %134, %plaid_fused_22, %135) <{frequency = 1 : i64, pattern_id = 53 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg26_0: !neura.data<i32, i1>, %plaid_arg26_1: !neura.data<i32, i1>, %plaid_arg26_2: !neura.data<i32, i1>, %plaid_arg26_3: !neura.data<i32, i1>):
          %138 = "neura.add"(%plaid_arg26_0, %plaid_arg26_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %139 = "neura.add"(%138, %plaid_arg26_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %140 = "neura.add"(%139, %plaid_arg26_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%140 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_26 = "neura.fused_op"(%plaid_fused_25, %133, %136, %plaid_fused_23) <{frequency = 1 : i64, pattern_id = 54 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg27_0: !neura.data<i32, i1>, %plaid_arg27_1: !neura.data<i32, i1>, %plaid_arg27_2: !neura.data<i32, i1>, %plaid_arg27_3: !neura.data<i32, i1>):
          %141 = "neura.add"(%plaid_arg27_0, %plaid_arg27_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %142 = "neura.add"(%141, %plaid_arg27_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %143 = "neura.add"(%142, %plaid_arg27_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%143 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_27 = "neura.fused_op"(%plaid_fused_26, %137, %plaid_fused_24) <{frequency = 1 : i64, pattern_id = 55 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg28_0: !neura.data<i32, i1>, %plaid_arg28_1: !neura.data<i32, i1>, %plaid_arg28_2: !neura.data<i32, i1>):
          %144 = "neura.add"(%plaid_arg28_0, %plaid_arg28_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %145 = "neura.add"(%144, %plaid_arg28_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %146 = "neura.div"(%145) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%146 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_27 to [%2, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg2 : memref<64x64xi32>) dependency_write_in(%arg5 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 56 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 57 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 58 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 59 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %22 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%14) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%21) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_0, %26, %plaid_fused_1, %27) <{frequency = 1 : i64, pattern_id = 60 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %30 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_4, %25, %28, %plaid_fused_2) <{frequency = 1 : i64, pattern_id = 61 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>, %plaid_arg6_2: !neura.data<i32, i1>, %plaid_arg6_3: !neura.data<i32, i1>):
          %33 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %plaid_arg6_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%34, %plaid_arg6_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%plaid_fused_5, %29, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 62 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<i32, i1>, %plaid_arg7_1: !neura.data<i32, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
          %36 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 63 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %40 = "neura.add"(%plaid_arg8_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 64 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %45 = "neura.add"(%plaid_arg9_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%2, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 65 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %53 = "neura.add"(%plaid_arg10_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = "neura.add"(%plaid_arg10_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%53, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%55 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%56, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 66 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %58 = "neura.add"(%plaid_arg11_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = "neura.add"(%plaid_arg11_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %60 = neura.load_indexed [%58, %59 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%50) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.mul"(%44) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%49) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%52) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%57) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_7, %62, %plaid_fused_8, %63) <{frequency = 1 : i64, pattern_id = 67 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>, %plaid_arg12_2: !neura.data<i32, i1>, %plaid_arg12_3: !neura.data<i32, i1>):
          %66 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%66, %plaid_arg12_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%67, %plaid_arg12_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%plaid_fused_11, %61, %64, %plaid_fused_9) <{frequency = 1 : i64, pattern_id = 68 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<i32, i1>, %plaid_arg13_1: !neura.data<i32, i1>, %plaid_arg13_2: !neura.data<i32, i1>, %plaid_arg13_3: !neura.data<i32, i1>):
          %69 = "neura.add"(%plaid_arg13_0, %plaid_arg13_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%69, %plaid_arg13_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%70, %plaid_arg13_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%plaid_fused_12, %65, %plaid_fused_10) <{frequency = 1 : i64, pattern_id = 69 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<i32, i1>, %plaid_arg14_1: !neura.data<i32, i1>, %plaid_arg14_2: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg14_0, %plaid_arg14_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %plaid_arg14_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.div"(%73) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_13 to [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_14 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 70 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg15_0: !neura.data<index, i1>, %plaid_arg15_1: !neura.data<index, i1>):
          %76 = "neura.add"(%plaid_arg15_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %77 = "neura.add"(%plaid_arg15_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%78 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = neura.load_indexed [%79, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_15 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 71 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg16_0: !neura.data<index, i1>, %plaid_arg16_1: !neura.data<index, i1>):
          %81 = "neura.add"(%plaid_arg16_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %82 = "neura.add"(%plaid_arg16_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %84 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_16 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 72 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg17_0: !neura.data<index, i1>, %plaid_arg17_1: !neura.data<index, i1>):
          %89 = "neura.add"(%plaid_arg17_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %90 = "neura.add"(%plaid_arg17_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%92, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_17 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 73 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg18_0: !neura.data<index, i1>, %plaid_arg18_1: !neura.data<index, i1>):
          %94 = "neura.add"(%plaid_arg18_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %95 = "neura.add"(%plaid_arg18_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %96 = neura.load_indexed [%94, %95 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%96 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.mul"(%86) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%80) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.mul"(%85) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.mul"(%88) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.mul"(%93) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_18 = "neura.fused_op"(%plaid_fused_14, %98, %plaid_fused_15, %99) <{frequency = 1 : i64, pattern_id = 74 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg19_0: !neura.data<i32, i1>, %plaid_arg19_1: !neura.data<i32, i1>, %plaid_arg19_2: !neura.data<i32, i1>, %plaid_arg19_3: !neura.data<i32, i1>):
          %102 = "neura.add"(%plaid_arg19_0, %plaid_arg19_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %103 = "neura.add"(%102, %plaid_arg19_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.add"(%103, %plaid_arg19_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%104 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_19 = "neura.fused_op"(%plaid_fused_18, %97, %100, %plaid_fused_16) <{frequency = 1 : i64, pattern_id = 75 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg20_0: !neura.data<i32, i1>, %plaid_arg20_1: !neura.data<i32, i1>, %plaid_arg20_2: !neura.data<i32, i1>, %plaid_arg20_3: !neura.data<i32, i1>):
          %105 = "neura.add"(%plaid_arg20_0, %plaid_arg20_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%105, %plaid_arg20_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%106, %plaid_arg20_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%107 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_20 = "neura.fused_op"(%plaid_fused_19, %101, %plaid_fused_17) <{frequency = 1 : i64, pattern_id = 76 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg21_0: !neura.data<i32, i1>, %plaid_arg21_1: !neura.data<i32, i1>, %plaid_arg21_2: !neura.data<i32, i1>):
          %108 = "neura.add"(%plaid_arg21_0, %plaid_arg21_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%108, %plaid_arg21_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.div"(%109) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_20 to [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %111 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_21 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 77 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg22_0: !neura.data<index, i1>, %plaid_arg22_1: !neura.data<index, i1>):
          %112 = "neura.add"(%plaid_arg22_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = "neura.add"(%plaid_arg22_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %114 = neura.load_indexed [%112, %113 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%114 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %115 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = neura.load_indexed [%115, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_22 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 78 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg23_0: !neura.data<index, i1>, %plaid_arg23_1: !neura.data<index, i1>):
          %117 = "neura.add"(%plaid_arg23_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %118 = "neura.add"(%plaid_arg23_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %119 = neura.load_indexed [%117, %118 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%119 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %120 = "neura.add"(%111) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = neura.load_indexed [%2, %120 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%2, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.add"(%111) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%2, %123 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_23 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 79 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg24_0: !neura.data<index, i1>, %plaid_arg24_1: !neura.data<index, i1>):
          %125 = "neura.add"(%plaid_arg24_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %126 = "neura.add"(%plaid_arg24_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%125, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%127 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %128 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_24 = "neura.fused_op"(%2, %111) <{frequency = 1 : i64, pattern_id = 80 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg25_0: !neura.data<index, i1>, %plaid_arg25_1: !neura.data<index, i1>):
          %130 = "neura.add"(%plaid_arg25_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = "neura.add"(%plaid_arg25_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %132 = neura.load_indexed [%130, %131 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%132 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.mul"(%122) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.mul"(%116) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.mul"(%121) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.mul"(%124) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.mul"(%129) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_25 = "neura.fused_op"(%plaid_fused_21, %134, %plaid_fused_22, %135) <{frequency = 1 : i64, pattern_id = 81 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg26_0: !neura.data<i32, i1>, %plaid_arg26_1: !neura.data<i32, i1>, %plaid_arg26_2: !neura.data<i32, i1>, %plaid_arg26_3: !neura.data<i32, i1>):
          %138 = "neura.add"(%plaid_arg26_0, %plaid_arg26_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %139 = "neura.add"(%138, %plaid_arg26_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %140 = "neura.add"(%139, %plaid_arg26_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%140 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_26 = "neura.fused_op"(%plaid_fused_25, %133, %136, %plaid_fused_23) <{frequency = 1 : i64, pattern_id = 82 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg27_0: !neura.data<i32, i1>, %plaid_arg27_1: !neura.data<i32, i1>, %plaid_arg27_2: !neura.data<i32, i1>, %plaid_arg27_3: !neura.data<i32, i1>):
          %141 = "neura.add"(%plaid_arg27_0, %plaid_arg27_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %142 = "neura.add"(%141, %plaid_arg27_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %143 = "neura.add"(%142, %plaid_arg27_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%143 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_27 = "neura.fused_op"(%plaid_fused_26, %137, %plaid_fused_24) <{frequency = 1 : i64, pattern_id = 83 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg28_0: !neura.data<i32, i1>, %plaid_arg28_1: !neura.data<i32, i1>, %plaid_arg28_2: !neura.data<i32, i1>):
          %144 = "neura.add"(%plaid_arg28_0, %plaid_arg28_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %145 = "neura.add"(%144, %plaid_arg28_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %146 = "neura.div"(%145) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%146 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_27 to [%2, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return
  }



  func.func @ixx(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.mul"(%plaid_fused_0#2, %plaid_fused_0#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_1:2 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %6 = "neura.add"(%plaid_arg2_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%plaid_arg2_1, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %8 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %plaid_fused_1#1 to [%plaid_fused_0#0, %plaid_fused_1#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_2:2 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg3_0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = neura.load_indexed [%plaid_arg3_1, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9, %11 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %plaid_fused_2#1 to [%plaid_fused_0#0, %plaid_fused_2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_3:2 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %12 = "neura.add"(%plaid_arg4_0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%plaid_arg4_1, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12, %14 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %plaid_fused_3#1 to [%plaid_fused_0#0, %plaid_fused_3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.mul"(%plaid_fused_0#2, %plaid_fused_0#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return
  }



  func.func @ixy(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg2 : memref<64x64xi32>) [original_read_memrefs(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.mul"(%plaid_fused_0#2, %5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_1:3 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %7 = "neura.add"(%plaid_arg2_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = neura.load_indexed [%plaid_arg2_1, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = neura.load_indexed [%plaid_arg2_1, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%7, %8, %9 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %10 = "neura.mul"(%plaid_fused_1#1, %plaid_fused_1#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%plaid_fused_0#0, %plaid_fused_1#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_2:3 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %11 = "neura.add"(%plaid_arg3_0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%plaid_arg3_1, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%plaid_arg3_1, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %14 = "neura.mul"(%plaid_fused_2#1, %plaid_fused_2#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%plaid_fused_0#0, %plaid_fused_2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_3:3 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %15 = "neura.add"(%plaid_arg4_0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %16 = neura.load_indexed [%plaid_arg4_1, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = neura.load_indexed [%plaid_arg4_1, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%15, %16, %17 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %18 = "neura.mul"(%plaid_fused_3#1, %plaid_fused_3#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%plaid_fused_0#0, %plaid_fused_3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
    }
    %dependency_read_out_0:2, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out#0, %dependency_read_out#1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = neura.load_indexed [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.mul"(%plaid_fused_0#2, %5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
    }
    return
  }



  func.func @iyy(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.mul"(%plaid_fused_0#2, %plaid_fused_0#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_1:2 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %6 = "neura.add"(%plaid_arg2_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%plaid_arg2_1, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %8 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %plaid_fused_1#1 to [%plaid_fused_0#0, %plaid_fused_1#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_2:2 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg3_0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = neura.load_indexed [%plaid_arg3_1, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9, %11 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %plaid_fused_2#1 to [%plaid_fused_0#0, %plaid_fused_2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_3:2 = "neura.fused_op"(%plaid_fused_0#1, %plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %12 = "neura.add"(%plaid_arg4_0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%plaid_arg4_1, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12, %14 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %plaid_fused_3#1 to [%plaid_fused_0#0, %plaid_fused_3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
        ^bb0:
          %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%2, %3, %4 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.mul"(%plaid_fused_0#2, %plaid_fused_0#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%plaid_fused_0#0, %plaid_fused_0#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return
  }



  func.func @sobel_x(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %12 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%12, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%15, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%plaid_fused_1, %plaid_fused_0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%plaid_fused_3, %plaid_fused_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%22, %20, %21, %23) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %24 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.sub"(%24, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%25, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_4 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_5 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<index, i1>, %plaid_arg6_1: !neura.data<index, i1>):
          %28 = "neura.add"(%plaid_arg6_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = "neura.add"(%plaid_arg6_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %30 = neura.load_indexed [%28, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = neura.load_indexed [%31, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<index, i1>, %plaid_arg7_1: !neura.data<index, i1>):
          %33 = "neura.add"(%plaid_arg7_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = "neura.add"(%plaid_arg7_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %36 = "neura.add"(%plaid_arg8_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%36, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%39, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %41 = "neura.add"(%plaid_arg9_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%43 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %44 = "neura.mul"(%32) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.mul"(%40) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%plaid_fused_6, %plaid_fused_5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.sub"(%plaid_fused_8, %plaid_fused_7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%46, %44, %45, %47) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<i32, i1>, %plaid_arg10_1: !neura.data<i32, i1>, %plaid_arg10_2: !neura.data<i32, i1>, %plaid_arg10_3: !neura.data<i32, i1>):
          %48 = "neura.add"(%plaid_arg10_0, %plaid_arg10_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %49 = "neura.sub"(%48, %plaid_arg10_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %50 = "neura.add"(%49, %plaid_arg10_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%50 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_9 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %52 = "neura.add"(%plaid_arg11_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %53 = "neura.add"(%plaid_arg11_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = neura.load_indexed [%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%54 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = neura.load_indexed [%55, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<index, i1>, %plaid_arg12_1: !neura.data<index, i1>):
          %57 = "neura.add"(%plaid_arg12_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = "neura.add"(%plaid_arg12_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%59 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<index, i1>, %plaid_arg13_1: !neura.data<index, i1>):
          %60 = "neura.add"(%plaid_arg13_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %61 = "neura.add"(%plaid_arg13_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%60, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%62 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%63, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<index, i1>, %plaid_arg14_1: !neura.data<index, i1>):
          %65 = "neura.add"(%plaid_arg14_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %66 = "neura.add"(%plaid_arg14_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%65, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%67 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %68 = "neura.mul"(%56) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.mul"(%64) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.sub"(%plaid_fused_11, %plaid_fused_10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.sub"(%plaid_fused_13, %plaid_fused_12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_14 = "neura.fused_op"(%70, %68, %69, %71) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg15_0: !neura.data<i32, i1>, %plaid_arg15_1: !neura.data<i32, i1>, %plaid_arg15_2: !neura.data<i32, i1>, %plaid_arg15_3: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg15_0, %plaid_arg15_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.sub"(%72, %plaid_arg15_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.add"(%73, %plaid_arg15_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_14 to [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_15 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg16_0: !neura.data<index, i1>, %plaid_arg16_1: !neura.data<index, i1>):
          %76 = "neura.add"(%plaid_arg16_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %77 = "neura.add"(%plaid_arg16_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%78 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = neura.load_indexed [%79, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_16 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg17_0: !neura.data<index, i1>, %plaid_arg17_1: !neura.data<index, i1>):
          %81 = "neura.add"(%plaid_arg17_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %82 = "neura.add"(%plaid_arg17_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_17 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg18_0: !neura.data<index, i1>, %plaid_arg18_1: !neura.data<index, i1>):
          %84 = "neura.add"(%plaid_arg18_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %85 = "neura.add"(%plaid_arg18_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %86 = neura.load_indexed [%84, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %87 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%87, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_18 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg19_0: !neura.data<index, i1>, %plaid_arg19_1: !neura.data<index, i1>):
          %89 = "neura.add"(%plaid_arg19_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %90 = "neura.add"(%plaid_arg19_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %92 = "neura.mul"(%80) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.mul"(%88) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.sub"(%plaid_fused_16, %plaid_fused_15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.sub"(%plaid_fused_18, %plaid_fused_17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_19 = "neura.fused_op"(%94, %92, %93, %95) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg20_0: !neura.data<i32, i1>, %plaid_arg20_1: !neura.data<i32, i1>, %plaid_arg20_2: !neura.data<i32, i1>, %plaid_arg20_3: !neura.data<i32, i1>):
          %96 = "neura.add"(%plaid_arg20_0, %plaid_arg20_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %97 = "neura.sub"(%96, %plaid_arg20_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %98 = "neura.add"(%97, %plaid_arg20_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_19 to [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %12 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%12, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%15, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%plaid_fused_1, %plaid_fused_0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%plaid_fused_3, %plaid_fused_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%22, %20, %21, %23) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %24 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.sub"(%24, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%25, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_4 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return
  }



  func.func @sobel_y(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %7 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%7, %8 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%2, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %14 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %16 = neura.load_indexed [%14, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.mul"(%11) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%plaid_fused_2, %plaid_fused_0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%plaid_fused_3, %plaid_fused_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%22, %20, %21, %23) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %24 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.sub"(%24, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%25, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_4 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_5 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<index, i1>, %plaid_arg6_1: !neura.data<index, i1>):
          %28 = "neura.add"(%plaid_arg6_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = "neura.add"(%plaid_arg6_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %30 = neura.load_indexed [%28, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<index, i1>, %plaid_arg7_1: !neura.data<index, i1>):
          %31 = "neura.add"(%plaid_arg7_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = "neura.add"(%plaid_arg7_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%31, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %34 = "neura.add"(%27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%2, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = "neura.add"(%27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = neura.load_indexed [%2, %36 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %38 = "neura.add"(%plaid_arg8_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%38, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%40 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %27) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %41 = "neura.add"(%plaid_arg9_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%43 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %44 = "neura.mul"(%35) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.mul"(%37) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%plaid_fused_7, %plaid_fused_5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.sub"(%plaid_fused_8, %plaid_fused_6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%46, %44, %45, %47) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<i32, i1>, %plaid_arg10_1: !neura.data<i32, i1>, %plaid_arg10_2: !neura.data<i32, i1>, %plaid_arg10_3: !neura.data<i32, i1>):
          %48 = "neura.add"(%plaid_arg10_0, %plaid_arg10_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %49 = "neura.sub"(%48, %plaid_arg10_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %50 = "neura.add"(%49, %plaid_arg10_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%50 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_9 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %52 = "neura.add"(%plaid_arg11_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %53 = "neura.add"(%plaid_arg11_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = neura.load_indexed [%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%54 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<index, i1>, %plaid_arg12_1: !neura.data<index, i1>):
          %55 = "neura.add"(%plaid_arg12_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %56 = "neura.add"(%plaid_arg12_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %57 = neura.load_indexed [%55, %56 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %58 = "neura.add"(%51) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%2, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.add"(%51) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%2, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<index, i1>, %plaid_arg13_1: !neura.data<index, i1>):
          %62 = "neura.add"(%plaid_arg13_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %63 = "neura.add"(%plaid_arg13_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%62, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%2, %51) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<index, i1>, %plaid_arg14_1: !neura.data<index, i1>):
          %65 = "neura.add"(%plaid_arg14_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %66 = "neura.add"(%plaid_arg14_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%65, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%67 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %68 = "neura.mul"(%59) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.mul"(%61) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.sub"(%plaid_fused_12, %plaid_fused_10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.sub"(%plaid_fused_13, %plaid_fused_11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_14 = "neura.fused_op"(%70, %68, %69, %71) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg15_0: !neura.data<i32, i1>, %plaid_arg15_1: !neura.data<i32, i1>, %plaid_arg15_2: !neura.data<i32, i1>, %plaid_arg15_3: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg15_0, %plaid_arg15_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.sub"(%72, %plaid_arg15_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.add"(%73, %plaid_arg15_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_14 to [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_15 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg16_0: !neura.data<index, i1>, %plaid_arg16_1: !neura.data<index, i1>):
          %76 = "neura.add"(%plaid_arg16_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %77 = "neura.add"(%plaid_arg16_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%78 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_16 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg17_0: !neura.data<index, i1>, %plaid_arg17_1: !neura.data<index, i1>):
          %79 = "neura.add"(%plaid_arg17_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %80 = "neura.add"(%plaid_arg17_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%79, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %82 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%2, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %84 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_17 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg18_0: !neura.data<index, i1>, %plaid_arg18_1: !neura.data<index, i1>):
          %86 = "neura.add"(%plaid_arg18_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %87 = "neura.add"(%plaid_arg18_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %88 = neura.load_indexed [%86, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%88 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_18 = "neura.fused_op"(%2, %75) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg19_0: !neura.data<index, i1>, %plaid_arg19_1: !neura.data<index, i1>):
          %89 = "neura.add"(%plaid_arg19_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %90 = "neura.add"(%plaid_arg19_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %92 = "neura.mul"(%83) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.mul"(%85) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.sub"(%plaid_fused_17, %plaid_fused_15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.sub"(%plaid_fused_18, %plaid_fused_16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_19 = "neura.fused_op"(%94, %92, %93, %95) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg20_0: !neura.data<i32, i1>, %plaid_arg20_1: !neura.data<i32, i1>, %plaid_arg20_2: !neura.data<i32, i1>, %plaid_arg20_3: !neura.data<i32, i1>):
          %96 = "neura.add"(%plaid_arg20_0, %plaid_arg20_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %97 = "neura.sub"(%96, %plaid_arg20_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %98 = "neura.add"(%97, %plaid_arg20_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_19 to [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %7 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%7, %8 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%2, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %14 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %16 = neura.load_indexed [%14, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.mul"(%11) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%plaid_fused_2, %plaid_fused_0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%plaid_fused_3, %plaid_fused_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%22, %20, %21, %23) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %24 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.sub"(%24, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%25, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_4 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return
  }


}
