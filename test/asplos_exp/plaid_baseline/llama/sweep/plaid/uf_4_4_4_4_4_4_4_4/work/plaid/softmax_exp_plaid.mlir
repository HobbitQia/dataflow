module {

  func.func @softmax_exp(%arg0: memref<16xi32>, %arg1: memref<16xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg1 : memref<16xi32>) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg1 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<16xi32>, %arg5: memref<16xi32>):
        %plaid_fused_0:2 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:counter->load_indexed->mul"}> ({
        ^bb0:
          %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %2 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %3 = "neura.mul"(%2, %2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%1, %3 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.add"(%plaid_fused_0#1) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %4 to [%plaid_fused_0#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_1:2 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>):
          %5 = "neura.add"(%plaid_arg2_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%5 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %7 = "neura.mul"(%6, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%5, %7 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8 = "neura.add"(%plaid_fused_1#1) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%plaid_fused_1#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_2:2 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg3_0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9, %11 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.add"(%plaid_fused_2#1) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%plaid_fused_2#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %plaid_fused_3:2 = "neura.fused_op"(%plaid_fused_0#0) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>):
          %13 = "neura.add"(%plaid_arg4_0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13, %15 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.add"(%plaid_fused_3#1) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%plaid_fused_3#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return
  }

}
