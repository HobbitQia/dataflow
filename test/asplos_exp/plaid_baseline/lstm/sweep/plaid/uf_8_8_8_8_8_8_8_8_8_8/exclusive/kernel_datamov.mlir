module {
  func.func @cell_update(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:4, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg4 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg4 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg5: memref<16xi32>, %arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg5, %arg6, %arg7, %arg8, %arg9 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_out:counter->load_indexed->load_indexed"}> ({
          %96 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%1#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%1#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.fused_op"(%10) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.add"(%16, %15) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %19:3 = "neura.fused_op"(%8) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%19#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.mul"(%22, %23) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.fused_op"(%21) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.add"(%27, %26) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %30:3 = "neura.fused_op"(%7) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%30#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.mul"(%33, %34) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%32) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%38, %37) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %41:3 = "neura.fused_op"(%6) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.mul"(%44, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.fused_op"(%43) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%49, %48) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%42 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %52:3 = "neura.fused_op"(%5) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %53 = "neura.data_mov"(%52#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%52#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%52#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%52#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.mul"(%55, %56) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%54) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.add"(%60, %59) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%53 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %63:3 = "neura.fused_op"(%4) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %64 = "neura.data_mov"(%63#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%63#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%63#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.mul"(%66, %67) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.fused_op"(%65) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.add"(%71, %70) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %74:3 = "neura.fused_op"(%3) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %75 = "neura.data_mov"(%74#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%74#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%74#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%74#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.mul"(%77, %78) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%76) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %84 to [%75 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %85:3 = "neura.fused_op"(%2) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = "neura.add"(%arg15) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%96 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%96, %97, %98 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %86 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%85#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%85#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.mul"(%88, %89) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.fused_op"(%87) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %96 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %97 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%98 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.add"(%93, %92) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %95 to [%86 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg5, %arg6, %arg7, %arg8 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg9 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @f_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @f_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @g_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @g_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @i_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @i_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @o_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @o_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.fused_op"(%6, %7) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.add"(%10, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%18, %19) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.add"(%22, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %24 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.add"(%26) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %33) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %36 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%38) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%39) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.fused_op"(%42, %43) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.add"(%46, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %48 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%52 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.fused_op"(%54, %55) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.add"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%62) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%63) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.fused_op"(%66, %67) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %72 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.add"(%74) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = neura.load_indexed [%76 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%82, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %84 to [%85 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%90, %91) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %98 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%arg11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%100 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%94, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @output_gate(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_out:counter->load_indexed->load_indexed"}> ({
          %80 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%1#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%1#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%1#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.mul"(%12, %11) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.mul"(%10, %14) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %17:3 = "neura.fused_op"(%8) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%17#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%17#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.mul"(%21, %20) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.mul"(%19, %23) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %26:3 = "neura.fused_op"(%7) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %27 = "neura.data_mov"(%26#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%26#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%26#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.mul"(%30, %29) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.mul"(%28, %32) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %34 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %35:3 = "neura.fused_op"(%6) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %36 = "neura.data_mov"(%35#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%35#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%35#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.mul"(%39, %38) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.mul"(%37, %41) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %43 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %44:3 = "neura.fused_op"(%5) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %45 = "neura.data_mov"(%44#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%44#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.mul"(%48, %47) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.mul"(%46, %50) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %52 to [%45 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %53:3 = "neura.fused_op"(%4) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %54 = "neura.data_mov"(%53#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%53#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%53#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%53#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.mul"(%57, %56) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.mul"(%55, %59) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %61 to [%54 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %62:3 = "neura.fused_op"(%3) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %63 = "neura.data_mov"(%62#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%62#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%62#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%62#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.mul"(%66, %65) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.mul"(%64, %68) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %70 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %71:3 = "neura.fused_op"(%2) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %80 = "neura.add"(%arg9) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%80 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %72 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%71#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%71#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.mul"(%75, %74) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.mul"(%73, %77) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%72 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

