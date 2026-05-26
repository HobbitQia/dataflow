module {
  func.func @resnet_block(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c0_i32 = arith.constant {latency = 1 : i32} 0 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11 = "neura.fused_op"(%2, %3#0, %3#1) <{frequency = 32 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>, %arg18: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34, %arg18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%10#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%10#1, %13) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%9#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %17 = "neura.mul"(%9#1, %16) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%8#1, %19) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %23 = "neura.mul"(%7#1, %22) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%6#1, %25) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2, %26) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %29 = "neura.mul"(%5#1, %28) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%2, %29) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%4#1, %31) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.fused_op"(%2, %32) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<4096xi32>) dependency_write_in(%arg3 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg2 : memref<4096xi32>), original_write_memrefs(%arg3 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg9, %arg11, %arg10 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: i32, %arg14: memref<4096xi32>):
        %1 = "neura.constant"() <{value = "%input1"}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
        %2:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %18 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%3#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6 = "neura.fused_op"(%5#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8 = "neura.fused_op"(%7#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.fused_op"(%9#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.fused_op"(%11#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14 = "neura.fused_op"(%13#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15:2 = "neura.fused_op"(%2#0) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %18 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%18, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.fused_op"(%15#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#1, %1) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %18 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %19 = "neura.sel"(%18, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%2#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%15#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%13#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%11#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %10 to [%9#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %8 to [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %6 to [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg9 : memref<4096xi32>) writes(%arg10 : memref<4096xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg6 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg6 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%3#0, %2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %34 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%arg17, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%34, %35 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11 = "neura.fused_op"(%2, %3#0, %3#1) <{frequency = 32 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>, %arg18: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34, %arg18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2, %11) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%10#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%10#1, %13) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %14) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%9#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %17 = "neura.mul"(%9#1, %16) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2, %17) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%8#1, %19) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %20) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %23 = "neura.mul"(%7#1, %22) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%2, %23) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%6#1, %25) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2, %26) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %29 = "neura.mul"(%5#1, %28) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%2, %29) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%4#1, %31) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.fused_op"(%2, %32) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %34 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_4:2, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_write_out_3, %arg7 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg8 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg7 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg8 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg9, %arg10, %arg11 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: memref<4096xi32>, %arg14: memref<4096xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %2:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%1) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %25 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9 = neura.load_indexed [%1 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%1, %9) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %25 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%25, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%1 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = "neura.add"(%8#1, %11) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %14 = "neura.add"(%7#1, %13) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %16 = "neura.add"(%6#1, %15) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = "neura.add"(%5#1, %17) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %20 = "neura.add"(%4#1, %19) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %22 = "neura.add"(%3#1, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = "neura.add"(%2#1, %23) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%2#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg9, %arg10 : memref<4096xi32>, memref<4096xi32>) writes(%arg11 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
}

