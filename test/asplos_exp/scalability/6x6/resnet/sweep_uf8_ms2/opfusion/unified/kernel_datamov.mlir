module {
  func.func @conv2d_1(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
          %40 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %41 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %42 = neura.load_indexed [%41 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = "neura.add"(%41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%40, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %48 = "neura.mul"(%46, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %49 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = "neura.add"(%49, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%40, %41, %44, %50 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%23, %17) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%22, %16) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%21, %15) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%20, %14) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%19, %13) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%18, %12) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%11, %24) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %40 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.add"(%40, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%41 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %25 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%7 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%6 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @relu(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c0_i32 = arith.constant {latency = 1 : i32} 0 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<4096xi32>) dependency_write_in(%arg1 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg0 : memref<4096xi32>), original_write_memrefs(%arg1 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg2, %arg4, %arg3 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg5: memref<4096xi32>, %arg6: i32, %arg7: memref<4096xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %38 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38, %39 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%1#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10:5 = "neura.fused_op"(%8) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:constant->fused_op:fused_op:add->load_indexed->fused_op:icmp->sel->fused_op:fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>):
          %38 = "neura.constant"() <{value = "%input1"}> : () -> !neura.data<i32, i1>
          %39 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.icmp"(%40) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %42 = "neura.sel"(%41, %40, %38) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %43 = "neura.add"(%arg8) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.icmp"(%44) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %46 = "neura.sel"(%45, %44, %38) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38, %39, %42, %43, %46 : !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %11 = "neura.data_mov"(%10#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%10#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%10#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%10#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%10#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%10#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%10#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%10#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%10#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%10#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%7, %16) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>, %arg9: !neura.data<i32, i1>):
          %38 = "neura.add"(%arg8) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.icmp"(%39) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %41 = "neura.sel"(%40, %39, %arg9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38, %41 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%6, %15) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>, %arg9: !neura.data<i32, i1>):
          %38 = "neura.add"(%arg8) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.icmp"(%39) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %41 = "neura.sel"(%40, %39, %arg9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38, %41 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%5, %14) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>, %arg9: !neura.data<i32, i1>):
          %38 = "neura.add"(%arg8) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.icmp"(%39) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %41 = "neura.sel"(%40, %39, %arg9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38, %41 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%4, %13) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>, %arg9: !neura.data<i32, i1>):
          %38 = "neura.add"(%arg8) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.icmp"(%39) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %41 = "neura.sel"(%40, %39, %arg9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38, %41 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%3, %12) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>, %arg9: !neura.data<i32, i1>):
          %38 = "neura.add"(%arg8) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.icmp"(%39) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %41 = "neura.sel"(%40, %39, %arg9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38, %41 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%9, %11) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %38 = "neura.icmp"(%arg8) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %39 = "neura.sel"(%38, %arg8, %arg9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %18 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %20 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %23 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %26 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %32 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<4096xi32>) writes(%arg3 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @conv2d_2(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
          %40 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %41 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %42 = neura.load_indexed [%41 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = "neura.add"(%41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%40, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %48 = "neura.mul"(%46, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %49 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = "neura.add"(%49, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%40, %41, %44, %50 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%23, %17) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%22, %16) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%21, %15) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%20, %14) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%19, %13) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%18, %12) <{frequency = 28 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %40 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = neura.load_indexed [%arg11, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.add"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%11, %24) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %40 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.add"(%40, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%41 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%10 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %25 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%7 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%6 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @add_residual(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096xi32>, %arg5: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "counter->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
          %35 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %36 = "neura.add"(%35) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %38 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %39 = "neura.add"(%37, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %36, %39 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%1#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13:2 = "neura.fused_op"(%10) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %35 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.add"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %38 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16:2 = "neura.fused_op"(%9) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %35 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.add"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %38 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %17 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%16#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19:2 = "neura.fused_op"(%8) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %35 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.add"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %38 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22:2 = "neura.fused_op"(%7) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %35 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.add"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %38 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %23 = "neura.data_mov"(%22#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25:2 = "neura.fused_op"(%6) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %35 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.add"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %38 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28:2 = "neura.fused_op"(%5) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %35 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %38 = "neura.add"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35, %38 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %29 = "neura.data_mov"(%28#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.fused_op"(%3, %32) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %35 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.add"(%35, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %34 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %30 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %24 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %18 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %15 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<4096xi32>, memref<4096xi32>) writes(%arg5 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
}

