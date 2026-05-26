module {

  func.func @sobel_x(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return
  }

}
