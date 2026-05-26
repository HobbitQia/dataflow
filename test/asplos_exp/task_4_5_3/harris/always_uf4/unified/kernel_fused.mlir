module {
  func.func @harris(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>) {
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %dependency_read_out, %dependency_write_out:2 = taskflow.task @fused_sibling dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0, %arg0 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg13, %arg11, %arg12 : memref<64x64xi32>, i32, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg14: memref<64x64xi32>, %arg15: i32, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %37 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%37) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%37, %38, %39, %40 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#1, %2#0) <{frequency = 26 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %arg18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%37) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%41, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%37, %39, %42 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 10 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:fused_op:add->load_indexed->mul->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%39, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.mul"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%37, %38, %41, %44 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5:4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 10 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:fused_op:add->load_indexed->mul->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%39, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.mul"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%37, %38, %41, %44 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6:4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 10 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:fused_op:add->load_indexed->mul->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%39, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.mul"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%37, %38, %41, %44 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %7:4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 10 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:fused_op:add->load_indexed->mul->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%37) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%arg19, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.mul"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%37, %38, %41, %44 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %8:4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 10 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:fused_op:add->load_indexed->mul->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = "neura.add"(%37) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%arg19, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = "neura.mul"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%37) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%37, %38, %41, %44 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %9 = "neura.fused_op"(%2#0, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%arg19, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = "neura.mul"(%38) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#0, %2#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = "neura.mul"(%38) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%3#2, %12, %2#0, %3#0, %11, %9) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%arg21, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%15, %3#1, %3#0, %2#0, %14, %10) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#2, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%arg19, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %39 = "neura.mul"(%38) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%2#2, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2#2, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.fused_op"(%8#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%7#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%6#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %23 = "neura.fused_op"(%5#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.fused_op"(%4#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.fused_op"(%3#0, %4#1) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%24, %25, %3#0, %4#0, %4#3, %4#2) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3#0, %4#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %27 = "neura.fused_op"(%3#0, %5#1) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%23, %27, %3#0, %5#0, %5#3, %5#2) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%3#0, %5#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %29 = "neura.fused_op"(%3#0, %6#1) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%22, %29, %3#0, %6#0, %6#3, %6#2) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%38, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3#0, %6#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %31 = "neura.fused_op"(%3#0, %7#1) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%7#3, %31, %7#0, %3#0, %21, %7#2) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%arg21, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%3#0, %7#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %33 = "neura.fused_op"(%3#0, %8#1) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%8#3, %33, %8#0, %3#0, %20, %8#2) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%arg21, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %34 to [%3#0, %8#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %35 = "neura.fused_op"(%3#0, %2#3) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %37 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%18, %35, %2#2, %3#0, %19, %17) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %37 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %39 = neura.load_indexed [%arg21, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %40 = "neura.mul"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%37, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = neura.load_indexed [%43, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.sub"(%41, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %36 to [%3#0, %2#2 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1:2 = taskflow.task @fused_sibling dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out#0, %dependency_write_out#1 : memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0, %arg0 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg13, %arg11, %arg12 : memref<64x64xi32>, i32, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg14: memref<64x64xi32>, %arg15: i32, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 109 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %12 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = "neura.add"(%12) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%12, %13 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3:3 = "neura.fused_op"(%2#1, %2#0) <{frequency = 26 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = "neura.add"(%12) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %arg18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %16 = "neura.add"(%12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%12, %14, %17 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%arg19, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%3#0, %2#0) <{frequency = 25 : i64, pattern_id = 13 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = neura.load_indexed [%12, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %14 = "neura.mul"(%13) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#2, %7, %2#0, %3#0, %6, %4) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %12 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%arg21, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.sub"(%19, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.sub"(%16, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2#0, %3#0) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>):
          %12 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %13 = "neura.add"(%arg19) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%10, %3#1, %3#0, %2#0, %9, %5) <{frequency = 10 : i64, pattern_id = 35 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->fused_op:add->load_indexed->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg18: !neura.data<i32, i1>, %arg19: !neura.data<i32, i1>, %arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<i32, i1>):
          %12 = "neura.sub"(%arg18, %arg19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.add"(%arg20) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %14 = neura.load_indexed [%13, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %15 = "neura.mul"(%14) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%12, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.sub"(%19, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.sub"(%16, %arg23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%22 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0, %2#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_2:2, %dependency_write_out_3:3 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out_1#0, %dependency_write_out_1#1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>, %arg18: memref<64x64xi32>, %arg19: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"(%2) <{frequency = 6 : i64, pattern_id = 31 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %16 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %17 = neura.load_indexed [%16, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = neura.load_indexed [%16, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%16, %arg20 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18, %19, %21 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2, %3#0) <{frequency = 4 : i64, pattern_id = 24 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %16 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%arg21, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%2, %3#0) <{frequency = 4 : i64, pattern_id = 24 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
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
    %dependency_read_out_4:2, %dependency_write_out_5:3 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out_1#0, %dependency_write_out_1#1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out_3#0, %dependency_write_out_3#1, %dependency_write_out_3#2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>, %arg18: memref<64x64xi32>, %arg19: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"(%2) <{frequency = 6 : i64, pattern_id = 31 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->load_indexed->fused_op:load_indexed->mul"}> ({
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
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_5#2, %dependency_write_out_5#1, %dependency_write_out_5#0 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) [original_read_memrefs(%arg5, %arg4, %arg3, %arg6, %arg7, %arg8 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg18, %arg19, %arg11, %arg20, %arg21, %arg22, %arg12, %arg23, %arg24, %arg25, %arg26, %arg16 : memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg27: memref<64x64xi32>, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: memref<64x64xi32>, %arg32: i32, %arg33: i32, %arg34: i32, %arg35: memref<64x64xi32>, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3:4 = "neura.fused_op"(%2) <{frequency = 26 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>):
          %30 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %31 = "neura.add"(%30) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%arg41, %31 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %33 = "neura.add"(%31) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %35 = neura.load_indexed [%34, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%30, %31, %32, %35 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %4:3 = "neura.fused_op"(%3#0, %2) <{frequency = 12 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%arg42, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.add"(%30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%30, %31, %34 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.fused_op"(%3#1, %2) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#1, %2, %5) <{frequency = 9 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%32, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%3#1, %2, %6, %3#2) <{frequency = 3 : i64, pattern_id = 28 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%arg42, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg43, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%arg44) {rhs_value = "%input9"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#1, %2, %7) <{frequency = 9 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %33 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%arg42, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg43, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9:2 = "neura.fused_op"(%3#0, %2) <{frequency = 163 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%arg42, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%30, %31 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.fused_op"(%9#0, %2) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%9#0, %2) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%9#0, %2, %11) <{frequency = 9 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%32, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%9#0, %2, %12, %9#1) <{frequency = 3 : i64, pattern_id = 28 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%arg42, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg43, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%arg44) {rhs_value = "%input5"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%9#0, %2, %13) <{frequency = 9 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %33 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%arg42, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg43, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%4#0, %2) <{frequency = 44 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%4#0, %2, %15) <{frequency = 9 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%32, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%4#0, %2, %16, %4#1) <{frequency = 3 : i64, pattern_id = 28 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%arg42, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg43, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%arg44) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%4#0, %2, %17) <{frequency = 9 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %32 = neura.load_indexed [%31, %30 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%arg42, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg43, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2, %4#0, %18, %4#2) <{frequency = 7 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg43, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %arg44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20:2 = "neura.fused_op"(%19) <{frequency = 16 : i64, pattern_id = 8 : i64, pattern_name = "div->mul"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>):
          %30 = "neura.div"(%arg41) {rhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.mul"(%30, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30, %31 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %21 = "neura.fused_op"(%2, %9#0, %14) <{frequency = 28 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg43, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%21, %10) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "add->div"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.div"(%30) {rhs_value = "%input7"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2, %3#1, %8) <{frequency = 28 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg43, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24:3 = "neura.fused_op"(%23, %3#3, %22, %20#1, %20#0) <{frequency = 3 : i64, pattern_id = 32 : i64, pattern_name = "fused_op:fused_op:fused_op:add->div->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub->fused_op:fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>, %arg45: !neura.data<i32, i1>):
          %30 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.div"(%30) {rhs_value = "%input11"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.mul"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.sub"(%32, %arg44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.mul"(%34, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.mul"(%35) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.sub"(%33, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.mul"(%arg45, %arg45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %39 = "neura.mul"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %40 = "neura.sub"(%39, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %41 = "neura.add"(%31, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %42 = "neura.mul"(%41, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %43 = "neura.mul"(%42) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %44 = "neura.sub"(%40, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31, %37, %44 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %25 = "neura.fused_op"(%20#0, %24#0, %22) <{frequency = 3 : i64, pattern_id = 36 : i64, pattern_name = "fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.mul"(%arg41, %arg41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.mul"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.sub"(%31, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.sub"(%32, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%20#0, %24#0, %22) <{frequency = 3 : i64, pattern_id = 36 : i64, pattern_name = "fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %30 = "neura.mul"(%arg41, %arg41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.mul"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.sub"(%31, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.mul"(%34) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.sub"(%32, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24#1 to [%2, %3#0 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3#0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %28 = "neura.add"(%3#0) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %25 to [%2, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %29 = "neura.add"(%3#0) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24#2 to [%2, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg16 : memref<64x64xi32>)
    }
    return
  }
}

