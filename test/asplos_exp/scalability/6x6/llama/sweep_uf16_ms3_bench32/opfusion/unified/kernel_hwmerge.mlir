module {
  func.func @qk_attention(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %32 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%32, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.add"(%34) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35, %36, %37 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#4, %2#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%arg12, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%32, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%2#2, %2#0, %2#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#2, %2#3, %2#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg12 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %2#0, %6) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %2#0, %8) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %2#0, %10) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%2#2, %2#0, %12) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2#2, %2#0, %14) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#2, %2#0, %16) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2#2, %2#0, %18) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2#2, %2#0, %20) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2#2, %2#0, %22) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.fused_op"(%2#2, %2#0, %24) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2#2, %2#0, %26) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.fused_op"(%2#2, %2#0, %28) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.fused_op"(%2#2, %2#0, %30) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @softmax_exp(%arg0: memref<32xi32>, %arg1: memref<32xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<32xi32>) dependency_write_in(%arg1 : memref<32xi32>) [original_read_memrefs(%arg0 : memref<32xi32>), original_write_memrefs(%arg1 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg2: memref<32xi32>, %arg3: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<32xi32>, %arg5: memref<32xi32>):
        %1:6 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %16 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.mul"(%20, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%21) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = "neura.add"(%16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%25) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %18, %19, %22, %23, %26 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %2:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14:2 = "neura.fused_op"(%1#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %16 = "neura.add"(%arg6) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.add"(%1#1) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%1#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %1#3 to [%1#2 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %1#5 to [%1#4 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %2#1 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%8#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%10#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%11#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %12#1 to [%12#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %13#1 to [%13#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %14#1 to [%14#0 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<32xi32>) writes(%arg3 : memref<32xi32>)
    }
    return
  }
  func.func @softmax_norm(%arg0: memref<32xi32>, %arg1: memref<1xi32>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg1[%c0] : memref<1xi32>
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<32xi32>) dependency_write_in(%arg0 : memref<32xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg0 : memref<32xi32>), original_write_memrefs(%arg0 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg2: memref<32xi32>, %arg3: memref<32xi32>, %arg4: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<32xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg5: memref<32xi32>, %arg6: i32):
        %2:5 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:add->load_indexed->div->fused_op:fused_op:add->load_indexed->div"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %18 = "neura.add"(%17) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.div"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%17) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.div"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %18, %20, %21, %23 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.fused_op"(%2#0) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->div"}> ({
        ^bb0(%arg7: !neura.data<index, i1>):
          %17 = neura.load_indexed [%arg7 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.div"(%17) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%18 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %15#1 to [%15#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %14#1 to [%14#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %13#1 to [%13#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %12#1 to [%12#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%11#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%10#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%8#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %2#4 to [%2#3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %2#2 to [%2#1 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3 : memref<32xi32>) writes(%arg3 : memref<32xi32>)
    }
    return
  }
  func.func @sv_attention(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %32 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%34, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.add"(%34) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35, %36, %37 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#4, %2#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%arg12, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%32, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%2#2, %2#0, %2#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#2, %2#3, %2#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg12 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %2#0, %6) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %2#0, %8) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %2#0, %10) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%2#2, %2#0, %12) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2#2, %2#0, %14) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#2, %2#0, %16) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2#2, %2#0, %18) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2#2, %2#0, %20) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2#2, %2#0, %22) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.fused_op"(%2#2, %2#0, %24) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2#2, %2#0, %26) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.fused_op"(%2#2, %2#0, %28) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.fused_op"(%2#2, %2#0, %30) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%32, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_gate(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %32 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%32, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.add"(%34) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35, %36, %37 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#4, %2#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%arg12, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%32, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%2#2, %2#0, %2#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#2, %2#3, %2#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg12 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %2#0, %6) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %2#0, %8) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %2#0, %10) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%2#2, %2#0, %12) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2#2, %2#0, %14) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#2, %2#0, %16) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2#2, %2#0, %18) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2#2, %2#0, %20) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2#2, %2#0, %22) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.fused_op"(%2#2, %2#0, %24) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2#2, %2#0, %26) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.fused_op"(%2#2, %2#0, %28) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.fused_op"(%2#2, %2#0, %30) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_up(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %32 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%32, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.add"(%34) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35, %36, %37 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#4, %2#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%arg12, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%32, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%2#2, %2#0, %2#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#2, %2#3, %2#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg12 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %2#0, %6) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %2#0, %8) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %2#0, %10) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%2#2, %2#0, %12) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2#2, %2#0, %14) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#2, %2#0, %16) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2#2, %2#0, %18) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2#2, %2#0, %20) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2#2, %2#0, %22) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.fused_op"(%2#2, %2#0, %24) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2#2, %2#0, %26) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.fused_op"(%2#2, %2#0, %28) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.fused_op"(%2#2, %2#0, %30) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_act(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<32xi32>, memref<32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg0, %arg1 : memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<32xi32>, %arg7: memref<32xi32>, %arg8: memref<32xi32>):
        %1:4 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %19 = "neura.add"(%17) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%20, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %18, %19, %22 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %2:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15:2 = "neura.fused_op"(%1#0) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.fused_op"(%1#0, %1#1) <{frequency = 224 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %17 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%18 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%1#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %15#1 to [%15#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14#1 to [%14#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %13#1 to [%13#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %12#1 to [%12#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%11#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%10#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%8#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %2#1 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %1#3 to [%1#2 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<32xi32>, memref<32xi32>) writes(%arg5 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_down(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %32 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %35 = neura.load_indexed [%32, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.add"(%34) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %37 = neura.load_indexed [%36 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35, %36, %37 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.fused_op"(%2#0, %2#4, %2#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg10, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%arg12, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%32, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%2#2, %2#0, %2#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%2#2, %2#3, %2#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg12 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = "neura.add"(%34, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.fused_op"(%2#2, %2#0, %6) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.fused_op"(%2#2, %2#0, %8) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.fused_op"(%2#2, %2#0, %10) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.fused_op"(%2#2, %2#0, %12) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.fused_op"(%2#2, %2#0, %14) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.fused_op"(%2#2, %2#0, %16) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.fused_op"(%2#2, %2#0, %18) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.fused_op"(%2#2, %2#0, %20) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.fused_op"(%2#2, %2#0, %22) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.fused_op"(%2#2, %2#0, %24) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.fused_op"(%2#2, %2#0, %26) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.fused_op"(%2#2, %2#0, %28) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2#0 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.fused_op"(%2#2, %2#0, %30) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%arg12, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3 to [%2#0 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
}

