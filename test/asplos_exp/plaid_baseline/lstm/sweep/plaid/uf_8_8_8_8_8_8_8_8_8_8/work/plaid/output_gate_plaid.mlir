module {

  func.func @output_gate(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %plaid_fused_0:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_out:counter->load_indexed->load_indexed"}> ({
        ^bb0:
          %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %2 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %3 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%1, %2, %3 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4 = "neura.mul"(%plaid_fused_0#2, %plaid_fused_0#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.mul"(%plaid_fused_0#1, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%plaid_fused_0#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_1:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>):
          %6 = "neura.add"(%plaid_arg2_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%6, %7, %8 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %9 = "neura.mul"(%plaid_fused_1#2, %plaid_fused_1#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.mul"(%plaid_fused_1#1, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%plaid_fused_1#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_2:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>):
          %11 = "neura.add"(%plaid_arg3_0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %14 = "neura.mul"(%plaid_fused_2#2, %plaid_fused_2#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.mul"(%plaid_fused_2#1, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%plaid_fused_2#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_3:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>):
          %16 = "neura.add"(%plaid_arg4_0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%16, %17, %18 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %19 = "neura.mul"(%plaid_fused_3#2, %plaid_fused_3#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.mul"(%plaid_fused_3#1, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%plaid_fused_3#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_4:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<index, i1>):
          %21 = "neura.add"(%plaid_arg5_0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%21, %22, %23 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %24 = "neura.mul"(%plaid_fused_4#2, %plaid_fused_4#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%plaid_fused_4#1, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%plaid_fused_4#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_5:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<index, i1>):
          %26 = "neura.add"(%plaid_arg6_0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%26, %27, %28 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %29 = "neura.mul"(%plaid_fused_5#2, %plaid_fused_5#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.mul"(%plaid_fused_5#1, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%plaid_fused_5#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_6:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<index, i1>):
          %31 = "neura.add"(%plaid_arg7_0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%31 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%31, %32, %33 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %34 = "neura.mul"(%plaid_fused_6#2, %plaid_fused_6#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.mul"(%plaid_fused_6#1, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %35 to [%plaid_fused_6#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %plaid_fused_7:3 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>):
          %36 = "neura.add"(%plaid_arg8_0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %39 = "neura.mul"(%plaid_fused_7#2, %plaid_fused_7#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.mul"(%plaid_fused_7#1, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%plaid_fused_7#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return
  }

}
