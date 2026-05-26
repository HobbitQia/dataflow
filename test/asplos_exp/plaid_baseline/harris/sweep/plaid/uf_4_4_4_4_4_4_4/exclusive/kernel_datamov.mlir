module {
  func.func @corner_response(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %c4_i32 = arith.constant {latency = 1 : i32} 4 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) value_inputs(%c4_i32 : i32) [original_read_memrefs(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %79 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %80 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %81 = neura.load_indexed [%79, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%79, %80, %81 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %15 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = neura.load_indexed [%14, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%13, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.fused_op"(%22, %25, %26) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %79 = "neura.mul"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%arg16, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.sub"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%27) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%21, %29) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>):
          %79 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%79, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.sub"(%28, %31) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%12, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %34:3 = "neura.fused_op"(%17, %11) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %79 = "neura.add"(%arg14) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %80 = neura.load_indexed [%arg15, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %81 = neura.load_indexed [%arg15, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%79, %80, %81 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%34#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%34#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = neura.load_indexed [%10, %36 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.fused_op"(%38, %40, %42) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %79 = "neura.mul"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%arg16, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.sub"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.fused_op"(%37, %39) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>):
          %79 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%79, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.sub"(%44, %46) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %48 to [%9, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %49:3 = "neura.fused_op"(%16, %8) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %79 = "neura.add"(%arg14) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %80 = neura.load_indexed [%arg15, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %81 = neura.load_indexed [%arg15, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%79, %80, %81 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %50 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%49#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%49#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%49#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%49#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = neura.load_indexed [%7, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%53, %55, %57) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %79 = "neura.mul"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%arg16, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.sub"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%52, %54) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>):
          %79 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%79, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.sub"(%59, %61) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %63 to [%6, %50 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %64:3 = "neura.fused_op"(%15, %5) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %79 = "neura.add"(%arg14) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %80 = neura.load_indexed [%arg15, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %81 = neura.load_indexed [%arg15, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%79, %80, %81 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %65 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%64#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%64#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%64#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%64#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = neura.load_indexed [%4, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.fused_op"(%68, %70, %72) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %79 = "neura.mul"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%arg16, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.sub"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.fused_op"(%67, %69) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.unicast:add->mul->mul"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>):
          %79 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %80 = "neura.mul"(%79, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%81 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.sub"(%74, %76) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %78 to [%3, %65 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg4, %arg5, %arg6 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @gaussian_blur(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.add"(%8) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%13, %14) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%17) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%19, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.add"(%25) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%27, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.add"(%34) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%36, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%39, %40) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.mul"(%43) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.mul"(%45) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.mul"(%47) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%49) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.mul"(%51) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%7, %53, %16, %54) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%56, %57, %58, %33) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61, %42) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %63 to [%64, %65 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.add"(%66) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.fused_op"(%68, %69) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.add"(%72) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%74, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.fused_op"(%77, %78) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.add"(%81) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%82) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%83, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%86, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.add"(%89) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%91, %92 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.fused_op"(%94, %95) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.add"(%98) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = neura.load_indexed [%100, %101 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.fused_op"(%103, %104) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %106 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.mul"(%107) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.mul"(%109) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.mul"(%111) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.mul"(%113) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.mul"(%115) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.fused_op"(%71, %117, %80, %118) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.fused_op"(%120, %121, %122, %97) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.fused_op"(%124, %125, %106) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %127 to [%128, %129 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.add"(%130) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %134 = "neura.fused_op"(%132, %133) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = "neura.add"(%136) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = "neura.data_mov"(%137) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = neura.load_indexed [%138, %139 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %141 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.fused_op"(%141, %142) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %144 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = "neura.add"(%145) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %147 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = neura.load_indexed [%147, %148 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %150 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %151 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %152 = neura.load_indexed [%150, %151 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %153 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %154 = "neura.add"(%153) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%154) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%155, %156 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.fused_op"(%158, %159) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = "neura.add"(%162) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %165 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = neura.load_indexed [%164, %165 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %167 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %168 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.fused_op"(%167, %168) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %172 = "neura.mul"(%171) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %173 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.mul"(%173) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %176 = "neura.mul"(%175) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %178 = "neura.mul"(%177) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.mul"(%179) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.data_mov"(%174) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%135, %181, %144, %182) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%172) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.data_mov"(%178) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.fused_op"(%184, %185, %186, %161) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.fused_op"(%188, %189, %170) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %191 = "neura.data_mov"(%190) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %193 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %191 to [%192, %193 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %194 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %195 = "neura.add"(%194) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %198 = "neura.fused_op"(%196, %197) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%198) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = "neura.add"(%200) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %203 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %204 = neura.load_indexed [%202, %203 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.fused_op"(%205, %206) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %208 = "neura.data_mov"(%207) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %210 = "neura.add"(%209) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %212 = "neura.data_mov"(%210) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = neura.load_indexed [%211, %212 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %214 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %215 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %216 = neura.load_indexed [%214, %215 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %217 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %218 = "neura.add"(%217) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %219 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = "neura.data_mov"(%218) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %221 = neura.load_indexed [%219, %220 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %223 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.fused_op"(%222, %223) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %225 = "neura.data_mov"(%224) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %227 = "neura.add"(%226) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = "neura.data_mov"(%227) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %229 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = neura.load_indexed [%228, %229 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %231 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %232 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %233 = "neura.fused_op"(%231, %232) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %234 = "neura.data_mov"(%233) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%216) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.mul"(%235) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.data_mov"(%204) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.mul"(%237) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %240 = "neura.mul"(%239) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %241 = "neura.data_mov"(%221) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %242 = "neura.mul"(%241) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %243 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.mul"(%243) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.data_mov"(%238) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %246 = "neura.data_mov"(%240) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.fused_op"(%199, %245, %208, %246) <{frequency = 1 : i64, pattern_id = 25 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%247) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249 = "neura.data_mov"(%236) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%242) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.fused_op"(%248, %249, %250, %225) <{frequency = 1 : i64, pattern_id = 26 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%244) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.fused_op"(%252, %253, %234) <{frequency = 1 : i64, pattern_id = 27 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %257 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256, %257 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg1 : memref<64x64xi32>) dependency_write_in(%arg4 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 28 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.add"(%8) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%13, %14) <{frequency = 1 : i64, pattern_id = 29 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%17) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%19, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.add"(%25) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%27, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 30 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.add"(%34) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%36, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%39, %40) <{frequency = 1 : i64, pattern_id = 31 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.mul"(%43) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.mul"(%45) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.mul"(%47) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%49) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.mul"(%51) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%7, %53, %16, %54) <{frequency = 1 : i64, pattern_id = 32 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%56, %57, %58, %33) <{frequency = 1 : i64, pattern_id = 33 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61, %42) <{frequency = 1 : i64, pattern_id = 34 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %63 to [%64, %65 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.add"(%66) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.fused_op"(%68, %69) <{frequency = 1 : i64, pattern_id = 35 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.add"(%72) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%74, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.fused_op"(%77, %78) <{frequency = 1 : i64, pattern_id = 36 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.add"(%81) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%82) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%83, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%86, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.add"(%89) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%91, %92 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.fused_op"(%94, %95) <{frequency = 1 : i64, pattern_id = 37 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.add"(%98) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = neura.load_indexed [%100, %101 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.fused_op"(%103, %104) <{frequency = 1 : i64, pattern_id = 38 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %106 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.mul"(%107) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.mul"(%109) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.mul"(%111) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.mul"(%113) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.mul"(%115) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.fused_op"(%71, %117, %80, %118) <{frequency = 1 : i64, pattern_id = 39 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.fused_op"(%120, %121, %122, %97) <{frequency = 1 : i64, pattern_id = 40 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.fused_op"(%124, %125, %106) <{frequency = 1 : i64, pattern_id = 41 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %127 to [%128, %129 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.add"(%130) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %134 = "neura.fused_op"(%132, %133) <{frequency = 1 : i64, pattern_id = 42 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = "neura.add"(%136) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = "neura.data_mov"(%137) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = neura.load_indexed [%138, %139 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %141 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.fused_op"(%141, %142) <{frequency = 1 : i64, pattern_id = 43 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %144 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = "neura.add"(%145) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %147 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = neura.load_indexed [%147, %148 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %150 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %151 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %152 = neura.load_indexed [%150, %151 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %153 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %154 = "neura.add"(%153) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%154) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%155, %156 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.fused_op"(%158, %159) <{frequency = 1 : i64, pattern_id = 44 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = "neura.add"(%162) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %165 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = neura.load_indexed [%164, %165 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %167 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %168 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.fused_op"(%167, %168) <{frequency = 1 : i64, pattern_id = 45 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %172 = "neura.mul"(%171) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %173 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.mul"(%173) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %176 = "neura.mul"(%175) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %178 = "neura.mul"(%177) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.mul"(%179) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.data_mov"(%174) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%135, %181, %144, %182) <{frequency = 1 : i64, pattern_id = 46 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%172) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.data_mov"(%178) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.fused_op"(%184, %185, %186, %161) <{frequency = 1 : i64, pattern_id = 47 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.fused_op"(%188, %189, %170) <{frequency = 1 : i64, pattern_id = 48 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %191 = "neura.data_mov"(%190) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %193 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %191 to [%192, %193 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %194 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %195 = "neura.add"(%194) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %198 = "neura.fused_op"(%196, %197) <{frequency = 1 : i64, pattern_id = 49 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%198) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = "neura.add"(%200) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %203 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %204 = neura.load_indexed [%202, %203 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.fused_op"(%205, %206) <{frequency = 1 : i64, pattern_id = 50 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %208 = "neura.data_mov"(%207) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %210 = "neura.add"(%209) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %212 = "neura.data_mov"(%210) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = neura.load_indexed [%211, %212 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %214 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %215 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %216 = neura.load_indexed [%214, %215 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %217 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %218 = "neura.add"(%217) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %219 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = "neura.data_mov"(%218) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %221 = neura.load_indexed [%219, %220 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %223 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.fused_op"(%222, %223) <{frequency = 1 : i64, pattern_id = 51 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %225 = "neura.data_mov"(%224) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %227 = "neura.add"(%226) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = "neura.data_mov"(%227) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %229 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = neura.load_indexed [%228, %229 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %231 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %232 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %233 = "neura.fused_op"(%231, %232) <{frequency = 1 : i64, pattern_id = 52 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %234 = "neura.data_mov"(%233) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%216) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.mul"(%235) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.data_mov"(%204) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.mul"(%237) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %240 = "neura.mul"(%239) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %241 = "neura.data_mov"(%221) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %242 = "neura.mul"(%241) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %243 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.mul"(%243) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.data_mov"(%238) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %246 = "neura.data_mov"(%240) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.fused_op"(%199, %245, %208, %246) <{frequency = 1 : i64, pattern_id = 53 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%247) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249 = "neura.data_mov"(%236) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%242) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.fused_op"(%248, %249, %250, %225) <{frequency = 1 : i64, pattern_id = 54 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%244) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.fused_op"(%252, %253, %234) <{frequency = 1 : i64, pattern_id = 55 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %257 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256, %257 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg2 : memref<64x64xi32>) dependency_write_in(%arg5 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 56 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.add"(%8) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%13, %14) <{frequency = 1 : i64, pattern_id = 57 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%17) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%19, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.add"(%25) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%27, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.fused_op"(%30, %31) <{frequency = 1 : i64, pattern_id = 58 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.add"(%34) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%36, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%39, %40) <{frequency = 1 : i64, pattern_id = 59 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.mul"(%43) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.mul"(%45) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.mul"(%47) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%49) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.mul"(%51) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%7, %53, %16, %54) <{frequency = 1 : i64, pattern_id = 60 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%56, %57, %58, %33) <{frequency = 1 : i64, pattern_id = 61 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61, %42) <{frequency = 1 : i64, pattern_id = 62 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %63 to [%64, %65 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.add"(%66) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.fused_op"(%68, %69) <{frequency = 1 : i64, pattern_id = 63 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.add"(%72) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%74, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.fused_op"(%77, %78) <{frequency = 1 : i64, pattern_id = 64 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.add"(%81) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%82) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%83, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%86, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.add"(%89) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%91, %92 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.fused_op"(%94, %95) <{frequency = 1 : i64, pattern_id = 65 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.add"(%98) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = neura.load_indexed [%100, %101 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.fused_op"(%103, %104) <{frequency = 1 : i64, pattern_id = 66 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %106 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.mul"(%107) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.mul"(%109) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.mul"(%111) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.mul"(%113) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.mul"(%115) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.fused_op"(%71, %117, %80, %118) <{frequency = 1 : i64, pattern_id = 67 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.fused_op"(%120, %121, %122, %97) <{frequency = 1 : i64, pattern_id = 68 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.fused_op"(%124, %125, %106) <{frequency = 1 : i64, pattern_id = 69 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %127 to [%128, %129 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.add"(%130) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %134 = "neura.fused_op"(%132, %133) <{frequency = 1 : i64, pattern_id = 70 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = "neura.add"(%136) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = "neura.data_mov"(%137) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = neura.load_indexed [%138, %139 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %141 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.fused_op"(%141, %142) <{frequency = 1 : i64, pattern_id = 71 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %144 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = "neura.add"(%145) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %147 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = neura.load_indexed [%147, %148 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %150 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %151 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %152 = neura.load_indexed [%150, %151 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %153 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %154 = "neura.add"(%153) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%154) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%155, %156 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.fused_op"(%158, %159) <{frequency = 1 : i64, pattern_id = 72 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = "neura.add"(%162) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %165 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = neura.load_indexed [%164, %165 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %167 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %168 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.fused_op"(%167, %168) <{frequency = 1 : i64, pattern_id = 73 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %172 = "neura.mul"(%171) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %173 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.mul"(%173) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %176 = "neura.mul"(%175) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %178 = "neura.mul"(%177) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.mul"(%179) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.data_mov"(%174) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%135, %181, %144, %182) <{frequency = 1 : i64, pattern_id = 74 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%172) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.data_mov"(%178) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.fused_op"(%184, %185, %186, %161) <{frequency = 1 : i64, pattern_id = 75 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.fused_op"(%188, %189, %170) <{frequency = 1 : i64, pattern_id = 76 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %191 = "neura.data_mov"(%190) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %193 = "neura.data_mov"(%131) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %191 to [%192, %193 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %194 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %195 = "neura.add"(%194) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %198 = "neura.fused_op"(%196, %197) <{frequency = 1 : i64, pattern_id = 77 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%198) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = "neura.add"(%200) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %203 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %204 = neura.load_indexed [%202, %203 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.fused_op"(%205, %206) <{frequency = 1 : i64, pattern_id = 78 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %208 = "neura.data_mov"(%207) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %210 = "neura.add"(%209) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %212 = "neura.data_mov"(%210) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = neura.load_indexed [%211, %212 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %214 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %215 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %216 = neura.load_indexed [%214, %215 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %217 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %218 = "neura.add"(%217) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %219 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = "neura.data_mov"(%218) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %221 = neura.load_indexed [%219, %220 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %223 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.fused_op"(%222, %223) <{frequency = 1 : i64, pattern_id = 79 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %225 = "neura.data_mov"(%224) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %227 = "neura.add"(%226) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = "neura.data_mov"(%227) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %229 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = neura.load_indexed [%228, %229 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %231 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %232 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %233 = "neura.fused_op"(%231, %232) <{frequency = 1 : i64, pattern_id = 80 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %258 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %259 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %260 = neura.load_indexed [%258, %259 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %234 = "neura.data_mov"(%233) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%216) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.mul"(%235) {latency = 1 : i32, rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.data_mov"(%204) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.mul"(%237) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %240 = "neura.mul"(%239) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %241 = "neura.data_mov"(%221) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %242 = "neura.mul"(%241) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %243 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.mul"(%243) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.data_mov"(%238) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %246 = "neura.data_mov"(%240) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.fused_op"(%199, %245, %208, %246) <{frequency = 1 : i64, pattern_id = 81 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%247) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249 = "neura.data_mov"(%236) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%242) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.fused_op"(%248, %249, %250, %225) <{frequency = 1 : i64, pattern_id = 82 : i64, pattern_name = "plaid.unicast:add->add->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>, %arg13: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.add"(%259, %arg13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%244) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.fused_op"(%252, %253, %234) <{frequency = 1 : i64, pattern_id = 83 : i64, pattern_name = "plaid.unicast:add->add->div"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %258 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %259 = "neura.add"(%258, %arg12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %260 = "neura.div"(%259) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%260 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %257 = "neura.data_mov"(%195) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256, %257 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ixx(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %27 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %28 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %29 = neura.load_indexed [%27, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%27, %28, %29 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.mul"(%15, %14) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%9, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %18:2 = "neura.fused_op"(%12, %8) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %27 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg7, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%7, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%11, %6) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %27 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg7, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%5, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%10, %4) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %27 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg7, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %9 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %10 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9, %10, %11 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.mul"(%6, %5) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ixy(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg2 : memref<64x64xi32>) [original_read_memrefs(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %39 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %40 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %41 = neura.load_indexed [%39, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%39, %40, %41 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = neura.load_indexed [%10, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.mul"(%16, %18) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%9, %14 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %21:3 = "neura.fused_op"(%13, %8) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %39 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%arg10, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = neura.load_indexed [%arg10, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%39, %40, %41 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%21#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%7, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %27:3 = "neura.fused_op"(%12, %6) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %39 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%arg10, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = neura.load_indexed [%arg10, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%39, %40, %41 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%27#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.mul"(%29, %30) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%5, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %33:3 = "neura.fused_op"(%11, %4) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_out:add->load_indexed->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %39 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %40 = neura.load_indexed [%arg10, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %41 = neura.load_indexed [%arg10, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%39, %40, %41 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%33#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.mul"(%35, %36) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%3, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
    }
    %dependency_read_out_0:2, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out#0, %dependency_read_out#1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %12 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%12, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%12, %13, %14 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = neura.load_indexed [%4, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.mul"(%7, %9) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%3, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @iyy(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %27 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %28 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %29 = neura.load_indexed [%27, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%27, %28, %29 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.mul"(%15, %14) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%9, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %18:2 = "neura.fused_op"(%12, %8) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %27 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg7, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%7, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%11, %6) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %27 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg7, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%5, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%10, %4) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %27 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg7, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27, %29 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:counter->counter->load_indexed"}> ({
          %9 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %10 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9, %10, %11 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.mul"(%6, %5) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @sobel_x(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.add"(%8) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%13, %14) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%17, %18) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.add"(%21) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%23, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.fused_op"(%26, %27) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.mul"(%30) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.mul"(%32) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.sub"(%16, %7) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.sub"(%29, %20) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%36, %37, %38, %39) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %41 to [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.add"(%44) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.fused_op"(%46, %47) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.add"(%50) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = neura.load_indexed [%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%55, %56) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.fused_op"(%59, %60) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.add"(%63) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = neura.load_indexed [%65, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.fused_op"(%68, %69) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.mul"(%72) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.mul"(%74) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.sub"(%58, %49) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.sub"(%71, %62) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.fused_op"(%78, %79, %80, %81) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %83 to [%84, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.fused_op"(%88, %89) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.add"(%92) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%93) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = neura.load_indexed [%94, %95 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.fused_op"(%97, %98) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.fused_op"(%101, %102) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.add"(%105) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%107, %108 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.fused_op"(%110, %111) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.mul"(%114) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.mul"(%116) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.sub"(%100, %91) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.sub"(%113, %104) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%120, %121, %122, %123) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %125 to [%126, %127 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %128 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.add"(%128) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.fused_op"(%130, %131) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %135 = "neura.add"(%134) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = neura.load_indexed [%136, %137 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %139 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.fused_op"(%139, %140) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %142 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %143 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.fused_op"(%143, %144) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %148 = "neura.add"(%147) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = "neura.data_mov"(%148) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %150 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %151 = neura.load_indexed [%149, %150 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %152 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %153 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %154 = "neura.fused_op"(%152, %153) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %155 = "neura.data_mov"(%154) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %156 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %157 = "neura.mul"(%156) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %158 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %159 = "neura.mul"(%158) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %160 = "neura.sub"(%142, %133) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.sub"(%155, %146) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.fused_op"(%162, %163, %164, %165) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %167 to [%168, %169 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.add"(%8) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%13, %14) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.fused_op"(%17, %18) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.add"(%21) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%23, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.fused_op"(%26, %27) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.mul"(%30) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.mul"(%32) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.sub"(%16, %7) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.sub"(%29, %20) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%36, %37, %38, %39) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %44 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.add"(%45, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %41 to [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @sobel_y(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.fused_op"(%8, %9) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.add"(%12) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%13) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%14, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%17) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%19, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.fused_op"(%22, %23) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.fused_op"(%26, %27) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.mul"(%30) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.mul"(%32) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.sub"(%25, %7) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.sub"(%29, %11) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%36, %37, %38, %39) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %41 to [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.add"(%44) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.fused_op"(%46, %47) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.fused_op"(%50, %51) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.add"(%54) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%55) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%56, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.add"(%59) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%60) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = neura.load_indexed [%61, %62 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.fused_op"(%64, %65) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.fused_op"(%68, %69) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.mul"(%72) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.mul"(%74) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.sub"(%67, %49) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.sub"(%71, %53) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.fused_op"(%78, %79, %80, %81) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %83 to [%84, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %86 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%86) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.fused_op"(%88, %89) <{frequency = 1 : i64, pattern_id = 10 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.fused_op"(%92, %93) <{frequency = 1 : i64, pattern_id = 11 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.add"(%96) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%97) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = neura.load_indexed [%98, %99 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %101 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.add"(%101) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%102) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = neura.load_indexed [%103, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %106 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.fused_op"(%106, %107) <{frequency = 1 : i64, pattern_id = 12 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.fused_op"(%110, %111) <{frequency = 1 : i64, pattern_id = 13 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.mul"(%114) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.mul"(%116) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.sub"(%109, %91) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.sub"(%113, %95) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%120, %121, %122, %123) <{frequency = 1 : i64, pattern_id = 14 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%87) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %125 to [%126, %127 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %128 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.add"(%128) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.fused_op"(%130, %131) <{frequency = 1 : i64, pattern_id = 15 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %135 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %136 = "neura.fused_op"(%134, %135) <{frequency = 1 : i64, pattern_id = 16 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %138 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = neura.load_indexed [%140, %141 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %143 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.add"(%143) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = "neura.data_mov"(%144) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %147 = neura.load_indexed [%145, %146 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %148 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %150 = "neura.fused_op"(%148, %149) <{frequency = 1 : i64, pattern_id = 17 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%150) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %153 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %154 = "neura.fused_op"(%152, %153) <{frequency = 1 : i64, pattern_id = 18 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %170 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %171 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %172 = neura.load_indexed [%170, %171 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %155 = "neura.data_mov"(%154) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %156 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %157 = "neura.mul"(%156) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %158 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %159 = "neura.mul"(%158) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %160 = "neura.sub"(%151, %133) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.sub"(%155, %137) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.fused_op"(%162, %163, %164, %165) <{frequency = 1 : i64, pattern_id = 19 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %170 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %171 = "neura.sub"(%170, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %172 = "neura.add"(%171, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%172 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.data_mov"(%129) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %167 to [%168, %169 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 1 : i64, pattern_id = 20 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.fused_op"(%8, %9) <{frequency = 1 : i64, pattern_id = 21 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.add"(%12) {latency = 1 : i32, rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%13) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%14, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%17) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%19, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.fused_op"(%22, %23) <{frequency = 1 : i64, pattern_id = 22 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.fused_op"(%26, %27) <{frequency = 1 : i64, pattern_id = 23 : i64, pattern_name = "plaid.fan_in:add->add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %44 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%44, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.mul"(%30) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.mul"(%32) {latency = 1 : i32, rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.sub"(%25, %7) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.sub"(%29, %11) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%36, %37, %38, %39) <{frequency = 1 : i64, pattern_id = 24 : i64, pattern_name = "plaid.unicast:add->sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %44 = "neura.add"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = "neura.sub"(%44, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = "neura.add"(%45, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %41 to [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
}

