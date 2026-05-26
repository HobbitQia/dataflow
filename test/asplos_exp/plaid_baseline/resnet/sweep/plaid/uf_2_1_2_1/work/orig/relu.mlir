module {

  func.func @relu(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<4096xi32>) dependency_write_in(%arg1 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg0 : memref<4096xi32>), original_write_memrefs(%arg1 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg2, %arg4, %arg3 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg5: memref<4096xi32>, %arg6: i32, %arg7: memref<4096xi32>):
        %1 = "neura.constant"() <{value = "%input1"}> : () -> !neura.data<i32, i1>
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.icmp"(%3) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %5 = "neura.sel"(%4, %3, %1) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<4096xi32>) writes(%arg3 : memref<4096xi32>)
    }
    return
  }

}
