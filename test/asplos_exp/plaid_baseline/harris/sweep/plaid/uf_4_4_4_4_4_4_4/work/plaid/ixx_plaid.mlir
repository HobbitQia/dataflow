module {

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

}
