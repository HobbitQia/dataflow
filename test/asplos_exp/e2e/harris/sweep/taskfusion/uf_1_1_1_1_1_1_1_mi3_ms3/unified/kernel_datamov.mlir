module {
  func.func @harris(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %c2_i32 = arith.constant {latency = 1 : i32} 2 : i32
    %c4_i32 = arith.constant {latency = 1 : i32} 4 : i32
    %c16_i32 = arith.constant {latency = 1 : i32} 16 : i32
    %dependency_read_out:2, %dependency_write_out:3 = taskflow.task @fused_pc dependency_read_in(%arg0, %arg0 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg1, %arg3, %arg2, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c2_i32, %c2_i32 : i32, i32) [original_read_memrefs(%arg0, %arg1, %arg0, %arg2, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg1, %arg3, %arg2, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg13, %arg11, %arg18, %arg15, %arg16 : memref<64x64xi32>, i32, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg19: memref<64x64xi32>, %arg20: i32, %arg21: memref<64x64xi32>, %arg22: memref<64x64xi32>, %arg23: i32, %arg24: memref<64x64xi32>, %arg25: memref<64x64xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 56 : i64, pattern_id = 4 : i64, pattern_name = "counter->add"}> ({
          %68 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %69 = "neura.add"(%68) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%68, %69 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
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
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18:2 = "neura.fused_op"(%16) <{frequency = 36 : i64, pattern_id = 2 : i64, pattern_name = "counter->fused_op:add->load_indexed"}> ({
        ^bb0(%arg26: !neura.data<index, i1>):
          %68 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %69 = "neura.add"(%arg26) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%68, %69 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          neura.yield results(%68, %70 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%15, %32) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%14, %31, %35) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>, %arg28: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %71 = "neura.sub"(%70, %arg28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%13, %30) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%12, %29, %39) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>, %arg28: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %71 = "neura.sub"(%70, %arg28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.fused_op"(%11, %28) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%70 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.fused_op"(%10, %27, %43) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>, %arg28: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %71 = "neura.sub"(%70, %arg28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%26, %9) <{frequency = 56 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %arg27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%69 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.fused_op"(%25, %17) <{frequency = 56 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %arg27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%69 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%8, %24, %49) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>, %arg28: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = "neura.add"(%arg27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %70 = neura.load_indexed [%69, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %71 = "neura.sub"(%70, %arg28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%23, %7, %51) <{frequency = 17 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>, %arg28: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68, %arg27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%arg28, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%47, %53) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "mul->sub"}> ({
        ^bb0(%arg26: !neura.data<i32, i1>, %arg27: !neura.data<i32, i1>):
          %68 = "neura.mul"(%arg26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %69 = "neura.sub"(%arg27, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%69 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:2 = "neura.fused_op"(%55, %45) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "add->mul"}> ({
        ^bb0(%arg26: !neura.data<i32, i1>, %arg27: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26, %arg27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %69 = "neura.mul"(%68, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68, %69 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %58 to [%22, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %59 = "neura.fused_op"(%5, %21, %41) <{frequency = 17 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg26: !neura.data<index, i1>, %arg27: !neura.data<index, i1>, %arg28: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%arg27, %68 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %70 = "neura.mul"(%69) {rhs_value = "%input4"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %71 = "neura.add"(%arg28, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%71 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%33, %60) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "mul->sub"}> ({
        ^bb0(%arg26: !neura.data<i32, i1>, %arg27: !neura.data<i32, i1>):
          %68 = "neura.mul"(%arg26) {rhs_value = "%input4"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %69 = "neura.sub"(%arg27, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%69 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63:2 = "neura.fused_op"(%62, %37) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "add->mul"}> ({
        ^bb0(%arg26: !neura.data<i32, i1>, %arg27: !neura.data<i32, i1>):
          %68 = "neura.add"(%arg26, %arg27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %69 = "neura.mul"(%68, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%68, %69 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %64 = "neura.data_mov"(%63#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %65 to [%20, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %66 = "neura.mul"(%57, %64) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %67 to [%19, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input6"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg13, %arg15, %arg16 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out#2, %dependency_write_out#1, %dependency_write_out#0 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) [original_read_memrefs(%arg5, %arg4, %arg3, %arg6, %arg7, %arg8 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg18, %arg19, %arg11, %arg20, %arg21, %arg22, %arg12, %arg23, %arg24, %arg25, %arg26, %arg16 : memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg27: memref<64x64xi32>, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: memref<64x64xi32>, %arg32: i32, %arg33: i32, %arg34: i32, %arg35: memref<64x64xi32>, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:2 = "neura.fused_op"(%3) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:counter->add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>):
          %111 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %112 = "neura.add"(%111) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %114 = neura.load_indexed [%113, %112 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%111, %114 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.fused_op"(%28, %30) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.fused_op"(%27, %33) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.fused_op"(%26, %36) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.fused_op"(%39, %25, %38) <{frequency = 17 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = neura.load_indexed [%111, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %113 = "neura.mul"(%112) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%arg43, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%114 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.fused_op"(%41, %35, %24, %42) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<index, i1>, %arg44: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%arg43) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%arg44, %112 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %114 = "neura.mul"(%113) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.add"(%111, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.fused_op"(%45, %23, %44) <{frequency = 3 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:fused_op:load_indexed->mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = neura.load_indexed [%arg41, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %112 = "neura.mul"(%111) {rhs_value = "%input9"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %113 = "neura.add"(%arg43, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %115 = neura.load_indexed [%arg41, %114 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %116 = "neura.mul"(%115) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %117 = "neura.add"(%113, %116) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%117 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.fused_op"(%22, %48) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.fused_op"(%21, %51) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.fused_op"(%20, %54) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.fused_op"(%57, %19, %56) <{frequency = 17 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = neura.load_indexed [%111, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %113 = "neura.mul"(%112) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%arg43, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%114 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.fused_op"(%59, %53, %18, %60) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<index, i1>, %arg44: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%arg43) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%arg44, %112 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %114 = "neura.mul"(%113) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.add"(%111, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.fused_op"(%63, %17, %62) <{frequency = 3 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:fused_op:load_indexed->mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = neura.load_indexed [%arg41, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %112 = "neura.mul"(%111) {rhs_value = "%input5"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %113 = "neura.add"(%arg43, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %115 = neura.load_indexed [%arg41, %114 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %116 = "neura.mul"(%115) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %117 = "neura.add"(%113, %116) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%117 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.fused_op"(%16, %66) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.fused_op"(%15, %69) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%113 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.fused_op"(%72, %14, %29) <{frequency = 17 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = neura.load_indexed [%111, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %113 = "neura.mul"(%112) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%arg43, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%114 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.fused_op"(%74, %71, %13, %75) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<index, i1>, %arg44: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%arg43) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%arg44, %112 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %114 = "neura.mul"(%113) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.add"(%111, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.fused_op"(%78, %12, %77) <{frequency = 3 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:fused_op:load_indexed->mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = neura.load_indexed [%arg41, %arg42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %112 = "neura.mul"(%111) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %113 = "neura.add"(%arg43, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %114 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %115 = neura.load_indexed [%arg41, %114 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %116 = "neura.mul"(%115) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %117 = "neura.add"(%113, %116) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%117 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.fused_op"(%80, %68, %81, %11) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<index, i1>, %arg44: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%arg43) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %arg44 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %114 = "neura.mul"(%113) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.add"(%111, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.fused_op"(%10, %84, %83) <{frequency = 3 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %114 = "neura.add"(%arg43, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.div"(%114) {rhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%65, %50, %88, %9) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<index, i1>, %arg44: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%arg43) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %arg44 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %114 = "neura.mul"(%113) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.add"(%111, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.fused_op"(%8, %91, %90) <{frequency = 3 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %114 = "neura.add"(%arg43, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.div"(%114) {rhs_value = "%input7"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.fused_op"(%47, %32, %95, %7) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<index, i1>, %arg44: !neura.data<index, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%arg43) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %arg44 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %114 = "neura.mul"(%113) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.add"(%111, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.fused_op"(%6, %98, %97) <{frequency = 3 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg41: !neura.data<index, i1>, %arg42: !neura.data<index, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %112 = "neura.add"(%arg42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %113 = neura.load_indexed [%112, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %114 = "neura.add"(%arg43, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %115 = "neura.div"(%114) {rhs_value = "%input11"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%115 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.fused_op"(%101, %94) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "add->mul"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>):
          %111 = "neura.add"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.mul"(%111, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.mul"(%87, %86) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.fused_op"(%100, %93, %105) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>, %arg43: !neura.data<i32, i1>):
          %111 = "neura.mul"(%arg41, %arg42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.sub"(%111, %arg43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%103, %107) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "mul->sub"}> ({
        ^bb0(%arg41: !neura.data<i32, i1>, %arg42: !neura.data<i32, i1>):
          %111 = "neura.mul"(%arg41) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.sub"(%arg42, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %109 to [%110, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input13"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg16 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
}

