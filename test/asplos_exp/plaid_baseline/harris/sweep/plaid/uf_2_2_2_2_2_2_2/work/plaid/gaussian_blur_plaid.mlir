module {

  func.func @gaussian_blur(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %22 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%14) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%21) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_0, %26, %plaid_fused_1, %27) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %30 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_4, %25, %28, %plaid_fused_2) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>, %plaid_arg6_2: !neura.data<i32, i1>, %plaid_arg6_3: !neura.data<i32, i1>):
          %33 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %plaid_arg6_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%34, %plaid_arg6_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%plaid_fused_5, %29, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<i32, i1>, %plaid_arg7_1: !neura.data<i32, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
          %36 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %40 = "neura.add"(%plaid_arg8_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %45 = "neura.add"(%plaid_arg9_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%2, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %53 = "neura.add"(%plaid_arg10_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = "neura.add"(%plaid_arg10_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%53, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%55 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%56, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %58 = "neura.add"(%plaid_arg11_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = "neura.add"(%plaid_arg11_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %60 = neura.load_indexed [%58, %59 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%50) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.mul"(%44) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%49) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%52) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%57) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_7, %62, %plaid_fused_8, %63) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>, %plaid_arg12_2: !neura.data<i32, i1>, %plaid_arg12_3: !neura.data<i32, i1>):
          %66 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%66, %plaid_arg12_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%67, %plaid_arg12_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%plaid_fused_11, %61, %64, %plaid_fused_9) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<i32, i1>, %plaid_arg13_1: !neura.data<i32, i1>, %plaid_arg13_2: !neura.data<i32, i1>, %plaid_arg13_3: !neura.data<i32, i1>):
          %69 = "neura.add"(%plaid_arg13_0, %plaid_arg13_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%69, %plaid_arg13_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%70, %plaid_arg13_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%plaid_fused_12, %65, %plaid_fused_10) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<i32, i1>, %plaid_arg14_1: !neura.data<i32, i1>, %plaid_arg14_2: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg14_0, %plaid_arg14_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %plaid_arg14_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.div"(%73) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_13 to [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg1 : memref<64x64xi32>) dependency_write_in(%arg4 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %22 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%14) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%21) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_0, %26, %plaid_fused_1, %27) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %30 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_4, %25, %28, %plaid_fused_2) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>, %plaid_arg6_2: !neura.data<i32, i1>, %plaid_arg6_3: !neura.data<i32, i1>):
          %33 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %plaid_arg6_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%34, %plaid_arg6_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%plaid_fused_5, %29, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<i32, i1>, %plaid_arg7_1: !neura.data<i32, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
          %36 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %40 = "neura.add"(%plaid_arg8_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %45 = "neura.add"(%plaid_arg9_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%2, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %53 = "neura.add"(%plaid_arg10_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = "neura.add"(%plaid_arg10_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%53, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%55 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%56, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %58 = "neura.add"(%plaid_arg11_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = "neura.add"(%plaid_arg11_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %60 = neura.load_indexed [%58, %59 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%50) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.mul"(%44) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%49) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%52) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%57) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_7, %62, %plaid_fused_8, %63) <{frequency = 1 : i64, pattern_id = 25 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>, %plaid_arg12_2: !neura.data<i32, i1>, %plaid_arg12_3: !neura.data<i32, i1>):
          %66 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%66, %plaid_arg12_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%67, %plaid_arg12_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%plaid_fused_11, %61, %64, %plaid_fused_9) <{frequency = 1 : i64, pattern_id = 26 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<i32, i1>, %plaid_arg13_1: !neura.data<i32, i1>, %plaid_arg13_2: !neura.data<i32, i1>, %plaid_arg13_3: !neura.data<i32, i1>):
          %69 = "neura.add"(%plaid_arg13_0, %plaid_arg13_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%69, %plaid_arg13_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%70, %plaid_arg13_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%plaid_fused_12, %65, %plaid_fused_10) <{frequency = 1 : i64, pattern_id = 27 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<i32, i1>, %plaid_arg14_1: !neura.data<i32, i1>, %plaid_arg14_2: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg14_0, %plaid_arg14_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %plaid_arg14_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.div"(%73) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_13 to [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg2 : memref<64x64xi32>) dependency_write_in(%arg5 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %plaid_fused_0 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 28 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg1_0: !neura.data<index, i1>, %plaid_arg1_1: !neura.data<index, i1>):
          %4 = "neura.add"(%plaid_arg1_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %5 = "neura.add"(%plaid_arg1_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_1 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 29 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg2_0: !neura.data<index, i1>, %plaid_arg2_1: !neura.data<index, i1>):
          %9 = "neura.add"(%plaid_arg2_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %10 = "neura.add"(%plaid_arg2_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_2 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 30 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg3_0: !neura.data<index, i1>, %plaid_arg3_1: !neura.data<index, i1>):
          %17 = "neura.add"(%plaid_arg3_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = "neura.add"(%plaid_arg3_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_3 = "neura.fused_op"(%2, %3) <{frequency = 1 : i64, pattern_id = 31 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg4_0: !neura.data<index, i1>, %plaid_arg4_1: !neura.data<index, i1>):
          %22 = "neura.add"(%plaid_arg4_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%plaid_arg4_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%14) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.mul"(%8) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%16) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%21) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_4 = "neura.fused_op"(%plaid_fused_0, %26, %plaid_fused_1, %27) <{frequency = 1 : i64, pattern_id = 32 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>, %plaid_arg5_3: !neura.data<i32, i1>):
          %30 = "neura.add"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%30, %plaid_arg5_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %plaid_arg5_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_5 = "neura.fused_op"(%plaid_fused_4, %25, %28, %plaid_fused_2) <{frequency = 1 : i64, pattern_id = 33 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg6_0: !neura.data<i32, i1>, %plaid_arg6_1: !neura.data<i32, i1>, %plaid_arg6_2: !neura.data<i32, i1>, %plaid_arg6_3: !neura.data<i32, i1>):
          %33 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.add"(%33, %plaid_arg6_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.add"(%34, %plaid_arg6_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%35 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_6 = "neura.fused_op"(%plaid_fused_5, %29, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 34 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg7_0: !neura.data<i32, i1>, %plaid_arg7_1: !neura.data<i32, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
          %36 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%36, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %38 = "neura.div"(%37) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%38 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %plaid_fused_7 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 35 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg8_0: !neura.data<index, i1>, %plaid_arg8_1: !neura.data<index, i1>):
          %40 = "neura.add"(%plaid_arg8_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %41 = "neura.add"(%plaid_arg8_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%42 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_8 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 36 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg9_0: !neura.data<index, i1>, %plaid_arg9_1: !neura.data<index, i1>):
          %45 = "neura.add"(%plaid_arg9_0) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = "neura.add"(%plaid_arg9_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%39) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%2, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_9 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 37 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg10_0: !neura.data<index, i1>, %plaid_arg10_1: !neura.data<index, i1>):
          %53 = "neura.add"(%plaid_arg10_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %54 = "neura.add"(%plaid_arg10_1) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %55 = neura.load_indexed [%53, %54 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%55 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%56, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %plaid_fused_10 = "neura.fused_op"(%2, %39) <{frequency = 1 : i64, pattern_id = 38 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%plaid_arg11_0: !neura.data<index, i1>, %plaid_arg11_1: !neura.data<index, i1>):
          %58 = "neura.add"(%plaid_arg11_0) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %59 = "neura.add"(%plaid_arg11_1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %60 = neura.load_indexed [%58, %59 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%50) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.mul"(%44) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%49) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%52) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%57) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_11 = "neura.fused_op"(%plaid_fused_7, %62, %plaid_fused_8, %63) <{frequency = 1 : i64, pattern_id = 39 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg12_0: !neura.data<i32, i1>, %plaid_arg12_1: !neura.data<i32, i1>, %plaid_arg12_2: !neura.data<i32, i1>, %plaid_arg12_3: !neura.data<i32, i1>):
          %66 = "neura.add"(%plaid_arg12_0, %plaid_arg12_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%66, %plaid_arg12_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%67, %plaid_arg12_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_12 = "neura.fused_op"(%plaid_fused_11, %61, %64, %plaid_fused_9) <{frequency = 1 : i64, pattern_id = 40 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%plaid_arg13_0: !neura.data<i32, i1>, %plaid_arg13_1: !neura.data<i32, i1>, %plaid_arg13_2: !neura.data<i32, i1>, %plaid_arg13_3: !neura.data<i32, i1>):
          %69 = "neura.add"(%plaid_arg13_0, %plaid_arg13_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%69, %plaid_arg13_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%70, %plaid_arg13_3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %plaid_fused_13 = "neura.fused_op"(%plaid_fused_12, %65, %plaid_fused_10) <{frequency = 1 : i64, pattern_id = 41 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%plaid_arg14_0: !neura.data<i32, i1>, %plaid_arg14_1: !neura.data<i32, i1>, %plaid_arg14_2: !neura.data<i32, i1>):
          %72 = "neura.add"(%plaid_arg14_0, %plaid_arg14_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %plaid_arg14_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.div"(%73) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%74 : !neura.data<i32, i1>)
        }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %plaid_fused_13 to [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return
  }

}
