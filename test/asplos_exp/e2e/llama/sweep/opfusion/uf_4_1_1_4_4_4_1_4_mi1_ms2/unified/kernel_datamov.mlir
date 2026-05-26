module {
  func.func @qk_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
          %52 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %53 = "neura.add"(%52) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%10, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%6, %12) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %14) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%19, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%8, %21) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %23) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%29, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %35) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%39 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%44, %45) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %47) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%51 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_exp(%arg0: memref<16xi32>, %arg1: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg1 : memref<16xi32>) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg1 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<16xi32>, %arg5: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.fused_op"(%2) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %8 = neura.load_indexed [%arg6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = "neura.mul"(%8, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %4 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %6 to [%7 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_norm(%arg0: memref<16xi32>, %arg1: memref<1xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %0 = memref.load %arg1[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg0 : memref<16xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg0 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg5: memref<16xi32>, %arg6: i32):
        %2:2 = "neura.fused_op"() <{frequency = 54 : i64, pattern_id = 2 : i64, pattern_name = "counter->load_indexed"}> ({
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%7, %8 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.div"(%4) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @sv_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
          %52 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %53 = "neura.add"(%52) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%7, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%6, %12) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %14) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%9, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%8, %21) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %23) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%29, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %35) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%39 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%44, %45) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %47) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%51 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_gate(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
          %52 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %53 = "neura.add"(%52) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%10, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%6, %12) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %14) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%19, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%8, %21) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %23) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%29, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %35) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%39 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%44, %45) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %47) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%51 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_up(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
          %52 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %53 = "neura.add"(%52) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%10, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%6, %12) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %14) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%19, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%8, %21) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %23) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%29, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %35) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%39 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%44, %45) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %47) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%51 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_act(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %9 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%10 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %7 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_down(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
          %52 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %53 = "neura.add"(%52) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%10, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%6, %12) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.fused_op"(%15, %14) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%19, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%8, %21) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.fused_op"(%24, %23) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%29, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%28) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%36, %35) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %38 to [%39 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%40) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%44, %45) <{frequency = 44 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %53 = "neura.mul"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%48, %47) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %52 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %53 = "neura.add"(%52, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%53 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %50 to [%51 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

