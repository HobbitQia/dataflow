module {
  func.func @harris(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>) {
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %20 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%20, %21, %22, %23 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#1, %2#0) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%20, %22, %25 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:3 = "neura.fused_op"(%2#0, %3#0) <{frequency = 12 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%20, %23, %26 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5:3 = "neura.fused_op"(%2#0, %3#0) <{frequency = 12 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%20, %23, %26 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%7, %3#1, %3#0, %2#0, %3#2, %6) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2#2, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%5#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%5#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%13, %5#1, %3#0, %5#0, %5#2, %12) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%4#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%4#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%16, %4#1, %3#0, %4#0, %4#2, %15) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%3#0, %4#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0, %5#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#0, %2#3) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%20, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%21 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%11, %18, %3#0, %2#2, %9, %10) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%3#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 109 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %7 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = "neura.add"(%7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%7, %8 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#1, %2#0) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = "neura.add"(%7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = "neura.add"(%7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%11, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%7, %9, %12 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%5, %3#1, %3#0, %2#0, %3#2, %4) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %7 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %8 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %11 = "neura.add"(%7, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%12, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %15 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.sub"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%16, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%arg2 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %20 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%20, %21, %22, %23 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#1, %2#0) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%20, %22, %25 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:3 = "neura.fused_op"(%2#0, %3#0) <{frequency = 12 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%20, %23, %26 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5:3 = "neura.fused_op"(%2#0, %3#0) <{frequency = 12 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%20, %23, %26 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%6, %3#1, %2#0, %3#0, %3#2, %7) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%arg19, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg19, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2#2, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%5#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%5#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%12, %5#1, %5#0, %3#0, %5#2, %13) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%arg19, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg19, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%4#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%4#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%15, %4#1, %4#0, %3#0, %4#2, %16) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%arg19, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg19, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%3#0, %4#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0, %5#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#0, %2#3) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %20 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%20, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%21 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%10, %18, %2#2, %3#0, %9, %11) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %20 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%arg19, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%20, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = neura.load_indexed [%arg19, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%24, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%3#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_4, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out_3 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 109 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %7 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = "neura.add"(%7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%7, %8 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#1, %2#0) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = "neura.add"(%7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = "neura.add"(%7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %12 = neura.load_indexed [%11, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%7, %9, %12 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#0, %3#0) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %7 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %8 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%8, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%4, %3#1, %2#0, %3#0, %3#2, %5) <{frequency = 10 : i64, pattern_id = 29 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %7 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %8 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %9 = neura.load_indexed [%arg19, %8 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %11 = "neura.add"(%7, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%arg19, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %15 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.sub"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%16, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_6:2, %dependency_write_out_7:3 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out_1, %dependency_write_out_5 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>, %arg18: memref<64x64xi32>, %arg19: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"(%2) <{frequency = 6 : i64, pattern_id = 25 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %16 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %17 = neura.load_indexed [%16, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = neura.load_indexed [%16, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%16, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18, %19, %21 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2, %3#0) <{frequency = 4 : i64, pattern_id = 20 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%2, %3#0) <{frequency = 4 : i64, pattern_id = 20 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%2, %3#0) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%16, %17 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %3#3 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%3#0, %11#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%3#0, %10#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%3#0, %9#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%3#0, %8#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%3#0, %7#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%3#0, %6#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%3#0, %2, %3#2) <{frequency = 65 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %16 = neura.load_indexed [%arg20, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%3#0, %5#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%3#0, %4#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%3#0, %12#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %15 = "neura.mul"(%12#1, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3#0, %12#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg12, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_8:2, %dependency_write_out_9:3 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out_1, %dependency_write_out_5 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out_7#0, %dependency_write_out_7#1, %dependency_write_out_7#2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>, %arg18: memref<64x64xi32>, %arg19: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"(%2) <{frequency = 6 : i64, pattern_id = 25 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %5 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %6 = neura.load_indexed [%5, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %7 = "neura.mul"(%6, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %8 = neura.load_indexed [%5, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %9 = neura.load_indexed [%5, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%5, %7, %8, %10 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        neura.store_indexed %3#3 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %4 = "neura.fused_op"(%3#0, %2, %3#2) <{frequency = 65 : i64, pattern_id = 10 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>):
          %5 = neura.load_indexed [%arg20, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %6 = "neura.mul"(%5, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg12, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_10:3, %dependency_write_out_11 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_9#2, %dependency_write_out_9#1, %dependency_write_out_9#0 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) [original_read_memrefs(%arg5, %arg4, %arg3, %arg6, %arg7, %arg8 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg18, %arg19, %arg11, %arg20, %arg21, %arg22, %arg12, %arg23, %arg24, %arg25, %arg26, %arg16 : memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg27: memref<64x64xi32>, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: memref<64x64xi32>, %arg32: i32, %arg33: i32, %arg34: i32, %arg35: memref<64x64xi32>, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"(%2) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>):
          %32 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %33 = "neura.add"(%32) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%arg41, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %35 = "neura.add"(%33) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %37 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:3 = "neura.fused_op"(%3#0, %2) <{frequency = 12 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%arg42, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = "neura.add"(%32) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %36 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.fused_op"(%3#1, %2) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#1, %2, %5) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %35 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%3#1, %2, %6, %3#2) <{frequency = 3 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%arg42, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%arg43, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.mul"(%arg44) {rhs_value = "%input9"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#1, %2, %7) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %35 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%arg42, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg43, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9:2 = "neura.fused_op"(%3#0, %2) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%arg42, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%32, %33 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.fused_op"(%9#0, %2) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%9#0, %2) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%9#0, %2, %11) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %35 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%9#0, %2, %12, %9#1) <{frequency = 3 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%arg42, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%arg43, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.mul"(%arg44) {rhs_value = "%input5"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%9#0, %2, %13) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %35 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%arg42, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg43, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%4#0, %2) <{frequency = 42 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%4#0, %2, %15) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%35, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%4#0, %2, %16, %4#1) <{frequency = 3 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%arg42, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%arg43, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.mul"(%arg44) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%4#0, %2, %17) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %36 = neura.load_indexed [%arg42, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %37 = "neura.mul"(%36) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg43, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.add"(%38, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2, %4#0, %18, %4#2) <{frequency = 7 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%arg43, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%35, %arg44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20:4 = "neura.fused_op"(%19) <{frequency = 4 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:fused_op:div->mul->mul->mul"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>):
          %32 = "neura.div"(%arg41) {rhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %21 = "neura.fused_op"(%2, %9#0, %14) <{frequency = 28 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%arg43, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%21, %10) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "add->div"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input7"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2, %3#1, %8) <{frequency = 28 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%arg43, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24:3 = "neura.fused_op"(%23, %3#3, %22, %20#2) <{frequency = 3 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:fused_op:add->div->fused_op:add->mul->fused_op:fused_op:add->mul->fused_op:fused_op:mul->sub->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.div"(%32) {rhs_value = "%input11"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.mul"(%34, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%33, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.mul"(%36, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.mul"(%33, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.sub"(%38, %arg44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %40 = "neura.mul"(%37) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.sub"(%39, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33, %35, %41 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %25 = "neura.fused_op"(%24#0, %22, %20#1) <{frequency = 3 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:add->mul->fused_op:fused_op:mul->sub->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.sub"(%34, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.mul"(%33) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.sub"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%2, %3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %26 = "neura.add"(%3#0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24#2 to [%2, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3#0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.fused_op"(%24#0, %22, %20#3) <{frequency = 3 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:add->mul->fused_op:fused_op:mul->sub->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.sub"(%34, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.mul"(%33) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.sub"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %29 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.mul"(%20#0, %20#0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.fused_op"(%24#0, %22, %30, %24#1) <{frequency = 4 : i64, pattern_id = 23 : i64, pattern_name = "fused_op:mul->sub->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %32 = "neura.mul"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.sub"(%32, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%arg44) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.sub"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg16 : memref<64x64xi32>)
    }
    return
  }
}

