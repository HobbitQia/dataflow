module {
  func.func @harris(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %c2_i32 = arith.constant {latency = 1 : i32} 2 : i32
    %c4_i32 = arith.constant {latency = 1 : i32} 4 : i32
    %c16_i32 = arith.constant {latency = 1 : i32} 16 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 3 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 3 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = "neura.add"(%63) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %66 = "neura.add"(%65) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%63, %64, %65, %66 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16:3 = "neura.fused_op"(%9, %8) <{frequency = 28 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = "neura.add"(%63) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%63, %65, %68 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %17 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%16#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%16#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34:3 = "neura.fused_op"(%7, %31) <{frequency = 6 : i64, pattern_id = 25 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %66 = neura.load_indexed [%65, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %67 = "neura.add"(%63) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%63, %66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%34#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.fused_op"(%6, %30) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.fused_op"(%5, %29) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.fused_op"(%44, %32, %28, %4, %33, %42) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %63 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %72 = "neura.sub"(%67, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.fused_op"(%14, %27) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%13, %26) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.fused_op"(%12, %25) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%38, %24) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%37, %23) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.fused_op"(%56, %39, %22, %36, %40, %54) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %63 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %72 = "neura.sub"(%67, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %46 to [%21, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %58 to [%20, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %59 = "neura.fused_op"(%19, %15) <{frequency = 137 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%52, %60, %18, %11, %48, %50) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %63 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %72 = "neura.sub"(%67, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%17, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 93 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %22 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9:3 = "neura.fused_op"(%8, %7) <{frequency = 28 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %22 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%22) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22, %24, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %10 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%9#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%9#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%6, %13) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %22 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%5, %12) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %22 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.fused_op"(%19, %14, %11, %4, %15, %17) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %22 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%27, %arg19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.sub"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%10, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%arg2 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 3 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 18 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %63 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 3 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = "neura.add"(%63) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %66 = "neura.add"(%65) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%63, %64, %65, %66 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16:3 = "neura.fused_op"(%9, %8) <{frequency = 28 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = "neura.add"(%63) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%63, %65, %68 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %17 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%16#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%16#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%16#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34:3 = "neura.fused_op"(%7, %31) <{frequency = 6 : i64, pattern_id = 25 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %66 = neura.load_indexed [%65, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %67 = "neura.add"(%63) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%63, %66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%34#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.fused_op"(%6, %30) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.fused_op"(%5, %29) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.fused_op"(%42, %32, %4, %28, %33, %44) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %63 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%arg19, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%arg19, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %72 = "neura.sub"(%67, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.fused_op"(%14, %27) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.fused_op"(%13, %26) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.fused_op"(%12, %25) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%38, %24) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%37, %23) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%65 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.fused_op"(%54, %39, %36, %22, %40, %56) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %63 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%arg19, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%arg19, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %72 = "neura.sub"(%67, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %46 to [%21, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %58 to [%20, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %59 = "neura.fused_op"(%19, %15) <{frequency = 137 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %63 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%50, %60, %11, %18, %48, %52) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %63 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%arg19, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.mul"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %68 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%arg19, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %72 = "neura.sub"(%67, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%17, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_4, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out_3 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 93 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %22 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%22, %23 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9:3 = "neura.fused_op"(%8, %7) <{frequency = 28 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %22 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %23 = "neura.add"(%22) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %26 = "neura.add"(%22) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%22, %24, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %10 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%9#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%9#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%6, %13) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %22 = "neura.add"(%arg16) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%arg17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.fused_op"(%5, %12) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %22 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%arg17) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%24 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.fused_op"(%17, %14, %4, %11, %15, %19) <{frequency = 8 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->mul->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>, %arg18: !neura.data<index, i1>, %arg19: !neura.data<index, i1>, %arg20: !neura.data<i32, i1>, %arg21: !neura.data<i32, i1>):
          %22 = "neura.sub"(%arg16, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = "neura.add"(%arg18) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%arg19, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg18) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg19, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.sub"(%arg20, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.sub"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %32 = "neura.add"(%31, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%10, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_6:2, %dependency_write_out_7:3 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out_1, %dependency_write_out_5 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 3 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>, %arg18: memref<64x64xi32>, %arg19: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:fused_op:counter->fused_op:load_indexed->mul->fused_op:load_indexed->mul"}> ({
          %57 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 3 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %58 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %59 = neura.load_indexed [%58, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %60 = "neura.mul"(%59, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %61 = neura.load_indexed [%58, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %62 = "neura.mul"(%61, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %58, %60, %62 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %13 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32:2 = "neura.fused_op"(%12, %29) <{frequency = 2 : i64, pattern_id = 31 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %60 = "neura.mul"(%58, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %60 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %33 = "neura.data_mov"(%32#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.fused_op"(%28, %11) <{frequency = 2 : i64, pattern_id = 26 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = neura.load_indexed [%arg20, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %58 = neura.load_indexed [%arg20, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = "neura.mul"(%58, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%59 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37:2 = "neura.fused_op"(%10, %27) <{frequency = 18 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %59 = "neura.mul"(%58, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %59 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %38 = "neura.data_mov"(%37#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%37#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40:2 = "neura.fused_op"(%9, %26) <{frequency = 18 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %59 = "neura.mul"(%58, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %59 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %41 = "neura.data_mov"(%40#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:2 = "neura.fused_op"(%8, %25) <{frequency = 18 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = "neura.mul"(%58, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %59 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%7, %24) <{frequency = 18 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = "neura.mul"(%58, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %59 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49:2 = "neura.fused_op"(%6, %23) <{frequency = 137 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %57 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg21, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %50 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%49#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%22, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %48 to [%21, %47 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%20, %44 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %30 to [%19, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %42 to [%18, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %39 to [%17, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %36 to [%16, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.store_indexed %34 to [%15, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %53 = neura.load_indexed [%14, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.mul"(%52, %54) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%13, %50 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg12, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_8:2, %dependency_write_out_9:3 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out_1, %dependency_write_out_5 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out_7#0, %dependency_write_out_7#1, %dependency_write_out_7#2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: memref<64x64xi32>, %arg18: memref<64x64xi32>, %arg19: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:fused_op:counter->fused_op:load_indexed->mul->fused_op:load_indexed->mul"}> ({
          %15 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %16 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %17 = neura.load_indexed [%16, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %18 = "neura.mul"(%17, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %19 = neura.load_indexed [%16, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%19, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%15, %16, %18, %20 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%10, %6) <{frequency = 2 : i64, pattern_id = 26 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<index, i1>):
          %15 = neura.load_indexed [%arg20, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = neura.load_indexed [%arg20, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%16, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%9, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %11 to [%8, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %14 to [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg12, %arg13, %arg14 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_10:3, %dependency_write_out_11 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_9#2, %dependency_write_out_9#1, %dependency_write_out_9#0 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) [original_read_memrefs(%arg5, %arg4, %arg3, %arg6, %arg7, %arg8 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 3 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg18, %arg19, %arg11, %arg20, %arg21, %arg22, %arg12, %arg23, %arg24, %arg25, %arg26, %arg16 : memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg27: memref<64x64xi32>, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: memref<64x64xi32>, %arg32: i32, %arg33: i32, %arg34: i32, %arg35: memref<64x64xi32>, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:4 = "neura.fused_op"(%3) <{frequency = 28 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>):
          %103 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 3 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %104 = "neura.add"(%103) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg41, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %106 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%103, %104, %105, %108 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%4#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%4#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%4#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%4#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%4#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%4#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%4#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18:3 = "neura.fused_op"(%9, %17) <{frequency = 12 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%arg42, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%103) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%103, %104, %107 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%18#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.fused_op"(%14, %26) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%27) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.fused_op"(%13, %29, %28) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %106 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%109, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.fused_op"(%12, %32, %31, %15) <{frequency = 3 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%arg42, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg43, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.mul"(%arg44) {rhs_value = "%input9"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %108 = "neura.add"(%106, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%108 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.fused_op"(%11, %35, %34) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %106 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%arg42, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg43, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%109, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39:2 = "neura.fused_op"(%8, %38) <{frequency = 137 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%arg42, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%103, %104 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.fused_op"(%45, %47) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.fused_op"(%44, %50) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.fused_op"(%43, %53, %52) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %106 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%109, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.fused_op"(%42, %56, %55, %46) <{frequency = 3 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%arg42, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg43, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.mul"(%arg44) {rhs_value = "%input5"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %108 = "neura.add"(%106, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%108 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.fused_op"(%41, %59, %58) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %106 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%arg42, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg43, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%109, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.fused_op"(%23, %62) <{frequency = 36 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.fused_op"(%22, %65, %64) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %106 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %arg41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%109, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.fused_op"(%21, %68, %67, %24) <{frequency = 3 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%arg42, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg43, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.mul"(%arg44) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %108 = "neura.add"(%106, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%108 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.fused_op"(%20, %71, %70) <{frequency = 9 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%104, %103 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %106 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%arg42, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg43, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%109, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.fused_op"(%74, %19, %73, %25) <{frequency = 7 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->fused_op:mul->add->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%103, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg43, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%106, %arg44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%107 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77:2 = "neura.fused_op"(%76) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "div->mul"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>):
          %103 = "neura.div"(%arg41) {rhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.mul"(%103, %103) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%103, %104 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %78 = "neura.data_mov"(%77#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%77#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%77#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.fused_op"(%81, %40, %61) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%103, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg43, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%106 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%83, %49) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "add->div"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.div"(%103) {rhs_value = "%input7"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%104 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.fused_op"(%87, %10, %37) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %104 = neura.load_indexed [%103, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg43, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%106 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90:3 = "neura.fused_op"(%89, %16, %86, %80, %79) <{frequency = 2 : i64, pattern_id = 39 : i64, pattern_name = "fused_op:fused_op:fused_op:add->div->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub->fused_op:fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>, %arg44: !neura.data<i32, i1>, %arg45: !neura.data<i32, i1>):
          %103 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.div"(%103) {rhs_value = "%input11"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.sub"(%105, %arg44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%104, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %108 = "neura.mul"(%107, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.sub"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.mul"(%arg45, %arg45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.mul"(%104, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %113 = "neura.sub"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%104, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.mul"(%114, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %116 = "neura.mul"(%115) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %117 = "neura.sub"(%113, %116) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%104, %110, %117 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %91 = "neura.data_mov"(%90#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%90#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%90#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.fused_op"(%78, %91, %85) <{frequency = 2 : i64, pattern_id = 43 : i64, pattern_name = "fused_op:mul->fused_op:mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %103 = "neura.mul"(%arg41, %arg41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %104 = "neura.mul"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %105 = "neura.sub"(%104, %103) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg42, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.mul"(%106, %106) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.sub"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %92 to [%96, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input13"} : !neura.data<i32, i1>
        %97 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%97) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %95 to [%98, %99 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input13"} : !neura.data<i32, i1>
        %100 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%100) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %93 to [%101, %102 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input13"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg16 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
}

