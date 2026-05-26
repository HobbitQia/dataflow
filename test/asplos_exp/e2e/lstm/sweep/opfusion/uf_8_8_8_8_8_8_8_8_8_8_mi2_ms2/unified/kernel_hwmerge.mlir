module {
  func.func @i_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @f_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @o_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @g_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @i_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @f_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @o_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @g_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %25 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%25, %26, %27 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.fused_op"(%2, %3#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2, %3#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2, %5) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2, %4) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2, %3#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %8) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.fused_op"(%2, %10) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%3#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%2, %13) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%3#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.fused_op"(%2, %16) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.add"(%3#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%2, %19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.fused_op"(%2, %22) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %25 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %26 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 64 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return
  }
  func.func @cell_update(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: memref<16xi32>) {
    %dependency_read_out:4, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg4 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg4 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg5: memref<16xi32>, %arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg5, %arg6, %arg7, %arg8, %arg9 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:counter->add->add"}> ({
          %31 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %32 = "neura.add"(%31) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%31) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%31, %32, %33 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %2 = "neura.fused_op"(%1#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %3 = "neura.fused_op"(%1#1) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%1#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%1#0) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.add"(%5, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%1#0 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %7 = "neura.add"(%3, %2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%1#1 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%1#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%1#2) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.add"(%9, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%1#2 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %11 = "neura.add"(%1#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%11) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%11) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.add"(%13, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%11 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %15 = "neura.add"(%1#0) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%15) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.add"(%17, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%15 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %19 = "neura.add"(%1#0) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%19) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%19 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %23 = "neura.add"(%1#0) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.fused_op"(%23) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.fused_op"(%23) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%25, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%23 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %27 = "neura.add"(%1#0) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.fused_op"(%27) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.fused_op"(%27) <{frequency = 80 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %31 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %32 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%27 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg5, %arg6, %arg7, %arg8 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg9 : memref<16xi32>)
    }
    return
  }
  func.func @output_gate(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:counter->add->fused_op:load_indexed->mul"}> ({
          %16 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %17 = "neura.add"(%16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %17, %19 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.fused_op"(%1#1) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %18 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %3:2 = "neura.fused_op"(%1#0) <{frequency = 72 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = "neura.add"(%arg9) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%1#0) <{frequency = 72 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%1#0) <{frequency = 72 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%1#0) <{frequency = 72 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%1#0) <{frequency = 72 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%1#0) <{frequency = 72 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %16 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9 = "neura.fused_op"(%1#0, %1#2) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%1#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %2 to [%1#1 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%8#0, %8#1) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%8#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.fused_op"(%7#0, %7#1) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%7#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.fused_op"(%6#0, %6#1) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%6#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%5#0, %5#1) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%5#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.fused_op"(%4#0, %4#1) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%4#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %15 = "neura.fused_op"(%3#0, %3#1) <{frequency = 184 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return
  }
}

