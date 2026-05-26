module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) {
    %dependency_read_out:9, %dependency_write_out:4 = taskflow.task @fused_sibling dependency_read_in(%arg10, %arg0, %arg2, %arg11, %arg3, %arg12, %arg4, %arg13, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2, %arg11, %arg0, %arg3, %arg12, %arg0, %arg4, %arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %19 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %20 = "neura.add"(%19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%19) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%19) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%19, %20, %21, %22 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 32 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>):
          %19 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %20 = neura.load_indexed [%19, %arg39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %24 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%3#0, %2#0) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#0, %2#0) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%3#0, %2#2) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#0, %2#1) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%3#0, %2#0) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %15 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#0, %2#3) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %7 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_0:9, %dependency_write_out_1:4 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out#0, %arg1, %arg6, %dependency_write_out#1, %arg7, %dependency_write_out#2, %arg8, %dependency_write_out#3, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out#0, %dependency_write_out#1, %dependency_write_out#2, %dependency_write_out#3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6, %arg11, %arg1, %arg7, %arg12, %arg1, %arg8, %arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %19 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %20 = "neura.add"(%19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = "neura.add"(%19) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%19) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%19, %20, %21, %22 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 32 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>):
          %19 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %20 = neura.load_indexed [%19, %arg39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %24 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.fused_op"(%2#0, %3#0) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%arg40, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %24 = "neura.add"(%23, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%3#0, %2#0) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#0, %2#0) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%3#0, %2#2) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#0, %2#1) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%3#0, %2#0) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %15 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#0, %2#3) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %19 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%22, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %7 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_2:5, %dependency_write_out_3 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_1#1, %arg14, %dependency_write_out_1#0, %dependency_write_out_1#3, %dependency_write_out_1#2 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %10 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %11 = "neura.add"(%10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %2 = "neura.fused_op"(%1#1) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %10 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %11 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %12 = "neura.mul"(%11, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %3 = "neura.fused_op"(%1#1) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %10 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %11 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %12 = "neura.mul"(%11, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %4:4 = "neura.fused_op"(%3, %2) <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:add->mul->mul->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %10 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %13 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%10, %11, %12, %13 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.fused_op"(%1#0, %4#1) <{frequency = 72 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %10 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%1#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %6:2 = "neura.fused_op"(%1#0, %4#2) <{frequency = 25 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %10 = "neura.add"(%arg30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %12 = "neura.mul"(%11, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%10, %12 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %7:2 = "neura.fused_op"(%1#0, %4#3) <{frequency = 25 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %10 = "neura.add"(%arg30) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %12 = "neura.mul"(%11, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%10, %12 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%4#0, %4#0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9:2 = "neura.fused_op"(%1#0, %8) <{frequency = 25 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %10 = "neura.add"(%arg30) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %12 = "neura.mul"(%11, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%10, %12 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return
  }
}

