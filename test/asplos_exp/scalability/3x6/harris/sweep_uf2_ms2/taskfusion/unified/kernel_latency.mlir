module {
  func.func @harris(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %c2_i32 = arith.constant {latency = 1 : i32} 2 : i32
    %c4_i32 = arith.constant {latency = 1 : i32} 4 : i32
    %c16_i32 = arith.constant {latency = 1 : i32} 16 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %12 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = "neura.add"(%12) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = "neura.add"(%12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = "neura.add"(%14) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%12, %13, %14, %15 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#0, %2#2) <{frequency = 2 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:add->load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = "neura.add"(%12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12, %15, %18 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#0, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2#2, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#0, %2#1) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%12, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%5, %8, %3#0, %2#0, %4, %3#1) <{frequency = 4 : i64, pattern_id = 32 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %12 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.sub"(%19, %arg20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.sub"(%16, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#0, %2#3) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%12, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%7, %10, %3#0, %2#2, %6, %3#2) <{frequency = 4 : i64, pattern_id = 32 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %12 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.sub"(%19, %arg20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.sub"(%16, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%3#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%arg2 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %12 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = "neura.add"(%12) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = "neura.add"(%12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = "neura.add"(%14) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%12, %13, %14, %15 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#0, %2#2) <{frequency = 2 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:add->load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%12, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%12, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12, %15, %18 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#0, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2#2, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %3#0) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#0, %2#1) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%12, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %2#0, %3#0, %5, %3#1) <{frequency = 4 : i64, pattern_id = 32 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %12 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%arg19, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.sub"(%19, %arg20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.sub"(%16, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#0, %2#3) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %12 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%12, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%6, %10, %2#2, %3#0, %7, %3#2) <{frequency = 4 : i64, pattern_id = 32 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %12 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%arg19, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.sub"(%19, %arg20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.sub"(%16, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%3#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out : memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:fused_op:counter->fused_op:add->load_indexed->mul"}> ({
          %4 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %5 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %6 = "neura.add"(%5) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%4, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%4, %5, %6, %8 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#1) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %4 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %5 = "neura.mul"(%4, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%5 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0, %2#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %2#3 to [%2#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_4, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_write_out_1 : memref<64x64xi32>) dependency_write_in(%arg4 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:fused_op:counter->fused_op:add->load_indexed->mul"}> ({
          %4 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %5 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %6 = "neura.add"(%5) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %7 = neura.load_indexed [%4, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%4, %5, %6, %8 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#1) <{frequency = 35 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %4 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %5 = "neura.mul"(%4, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%5 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0, %2#1 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %2#3 to [%2#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_6:2, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%dependency_write_out, %dependency_write_out_1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg5 : memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"(%2) <{frequency = 2 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>):
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %9 = neura.load_indexed [%7, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%7, %10 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2, %3#0) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = neura.load_indexed [%arg17, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%7, %8 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %3#1 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%3#0, %4#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.mul"(%4#1, %5) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0, %4#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg12 : memref<64x64xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_7, %dependency_write_out_5, %dependency_write_out_3 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) [original_read_memrefs(%arg5, %arg4, %arg3, %arg6, %arg7, %arg8 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg18, %arg19, %arg11, %arg20, %arg21, %arg22, %arg12, %arg23, %arg24, %arg25, %arg26, %arg16 : memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg27: memref<64x64xi32>, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: memref<64x64xi32>, %arg32: i32, %arg33: i32, %arg34: i32, %arg35: memref<64x64xi32>, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %4:2 = "neura.fused_op"(%3, %2) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg42, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.fused_op"(%4#0, %2) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%4#0, %2, %5) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %28 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%4#0, %2, %6, %4#1) <{frequency = 3 : i64, pattern_id = 22 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg42, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg43, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.mul"(%arg44) {rhs_value = "%input9"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%4#0, %2, %7) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %28 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%arg42, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%arg43, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2, %4#0, %8) <{frequency = 3 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg43, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input11"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10:2 = "neura.fused_op"(%3, %2) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg42, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11 = "neura.fused_op"(%10#0, %2) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%10#0, %2, %11) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %28 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%10#0, %2, %12, %10#1) <{frequency = 3 : i64, pattern_id = 22 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg42, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg43, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.mul"(%arg44) {rhs_value = "%input5"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%10#0, %2, %13) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %28 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%arg42, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%arg43, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2, %10#0, %14) <{frequency = 3 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg43, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input7"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16:2 = "neura.fused_op"(%3, %2) <{frequency = 91 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg42, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%25, %26 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %17 = "neura.fused_op"(%16#0, %2) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%16#0, %2, %17) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%16#0, %2, %18, %16#1) <{frequency = 3 : i64, pattern_id = 22 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg42, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg43, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.mul"(%arg44) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.fused_op"(%16#0, %2, %19) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%arg42, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%arg43, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2, %16#0, %20) <{frequency = 3 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg43, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%21, %9, %15) <{frequency = 2 : i64, pattern_id = 31 : i64, pattern_name = "fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.mul"(%arg41, %arg41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.mul"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.sub"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.sub"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.fused_op"(%21, %9, %15) <{frequency = 2 : i64, pattern_id = 31 : i64, pattern_name = "fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %25 = "neura.mul"(%arg41, %arg41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.mul"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.sub"(%26, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.mul"(%29) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.sub"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input13"} : !neura.data<i32, i1>
        %24 = "neura.add"(%3) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %23 to [%2, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input13"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg16 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
}

