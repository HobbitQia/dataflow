module {
  func.func @sobel_x(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %70 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = "neura.add"(%70) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%72) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%70, %71, %72, %73 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17:3 = "neura.fused_op"(%9, %15) <{frequency = 6 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:add->load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.mul"(%72) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %75 = neura.load_indexed [%74, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %76 = "neura.mul"(%75) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70, %73, %76 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%17#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:4 = "neura.fused_op"(%8, %33) <{frequency = 4 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %76 = neura.load_indexed [%75, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %77 = "neura.mul"(%76) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70, %71, %74, %77 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%36#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%36#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%36#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:4 = "neura.fused_op"(%7, %32) <{frequency = 4 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %76 = neura.load_indexed [%75, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %77 = "neura.mul"(%76) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70, %71, %74, %77 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%43#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%43#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%43#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%31, %16, %14) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%30, %10, %6) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%29, %40, %39) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%28, %47, %46) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%5, %27) <{frequency = 75 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%13, %26) <{frequency = 75 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%4, %25, %53, %59, %34) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%72, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %63 to [%24, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %64 = "neura.fused_op"(%38, %23, %55, %41, %42) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%arg9, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %65 to [%22, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = "neura.fused_op"(%45, %21, %57, %48, %49) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%arg9, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %67 to [%20, %44 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %68 = "neura.fused_op"(%12, %19, %51, %61, %35) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%72, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %69 to [%18, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:2 = "neura.fused_op"() <{frequency = 187 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %21 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %22 = "neura.add"(%21) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%21, %22 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9:2 = "neura.fused_op"(%7) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "counter->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %21 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %22 = "neura.add"(%21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%21, %24 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%9#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%13, %8, %6) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.sub"(%25, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%5, %12) <{frequency = 75 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%4, %11, %16, %18, %14) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg8, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%23, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%27, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%10, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %70 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = "neura.add"(%70) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%72) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%70, %71, %72, %73 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17:3 = "neura.fused_op"(%9, %15) <{frequency = 6 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:add->load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %71 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%70, %71 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.mul"(%72) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %74 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %75 = neura.load_indexed [%70, %74 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %76 = "neura.mul"(%75) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70, %73, %76 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%17#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%17#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:4 = "neura.fused_op"(%8, %33) <{frequency = 4 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %76 = neura.load_indexed [%arg7, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %77 = "neura.mul"(%76) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70, %71, %74, %77 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%36#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%36#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%36#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:4 = "neura.fused_op"(%7, %32) <{frequency = 4 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%70) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.add"(%70) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %76 = neura.load_indexed [%arg7, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %77 = "neura.mul"(%76) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%70, %71, %74, %77 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%43#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%43#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%43#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%31, %16, %14) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%30, %10, %6) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%29, %40, %39) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%28, %47, %46) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%73, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.sub"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%75 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%5, %27) <{frequency = 75 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%13, %26) <{frequency = 75 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%4, %25, %53, %59, %34) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%arg7, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%72, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %63 to [%24, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %64 = "neura.fused_op"(%38, %23, %55, %41, %42) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%arg7, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%arg9, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %65 to [%22, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = "neura.fused_op"(%45, %21, %57, %48, %49) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%arg7, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%arg9, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %67 to [%20, %44 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %68 = "neura.fused_op"(%12, %19, %51, %61, %35) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %70 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %72 = neura.load_indexed [%71, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %74 = neura.load_indexed [%arg7, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %75 = "neura.mul"(%74) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %76 = "neura.add"(%arg8, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %77 = "neura.sub"(%72, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %78 = "neura.sub"(%76, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %79 = "neura.add"(%78, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%79 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %69 to [%18, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:2 = "neura.fused_op"() <{frequency = 187 : i64, pattern_id = 5 : i64, pattern_name = "counter->add"}> ({
          %21 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %22 = "neura.add"(%21) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%21, %22 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9:2 = "neura.fused_op"(%7) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "counter->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %21 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %22 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%21, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%21, %24 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%9#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%9#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%13, %8, %6) <{frequency = 10 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->fused_op:add->load_indexed->sub"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.sub"(%25, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%26 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%5, %12) <{frequency = 75 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%4, %11, %16, %18, %14) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg7, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg8, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.sub"(%23, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%27, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%29, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%10, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
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
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:4 = "neura.fused_op"(%3) <{frequency = 6 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %23 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%23, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.mul"(%27, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25, %26, %28 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%4#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%4#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15:2 = "neura.fused_op"(%14, %10) <{frequency = 25 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %23 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%arg7, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.data_mov"(%15#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:2 = "neura.fused_op"(%18, %9) <{frequency = 25 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %23 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%arg7, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %11 to [%8, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%7, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%6, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%5, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "counter->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = "neura.mul"(%8, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %7, %9 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%4, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
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
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:4 = "neura.fused_op"(%3) <{frequency = 6 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %23 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %24 = neura.load_indexed [%23, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%23, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.mul"(%27, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25, %26, %28 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%4#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%4#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15:2 = "neura.fused_op"(%14, %10) <{frequency = 25 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %23 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%arg7, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.data_mov"(%15#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%15#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:2 = "neura.fused_op"(%18, %9) <{frequency = 25 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %23 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = neura.load_indexed [%arg7, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.mul"(%24, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %11 to [%8, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%7, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%6, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %13 to [%5, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "counter->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = "neura.mul"(%8, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %7, %9 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%4, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:4 = "neura.fused_op"(%3) <{frequency = 3 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %45 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %46 = neura.load_indexed [%45, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %47 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %48 = neura.load_indexed [%45, %47 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%45, %46, %47, %48 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %15 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%4#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%4#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%4#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20:2 = "neura.fused_op"(%19, %14) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %45 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg10, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%45, %46 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %21 = "neura.data_mov"(%20#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%20#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%20#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25:2 = "neura.fused_op"(%24, %13) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %45 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg10, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%45, %46 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.fused_op"(%12, %29, %15) <{frequency = 126 : i64, pattern_id = 8 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %45 = neura.load_indexed [%arg9, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.mul"(%45, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %31 to [%11, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %33 = neura.load_indexed [%10, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.mul"(%28, %34) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %36 to [%9, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = neura.load_indexed [%8, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.mul"(%23, %38) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%7, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%6, %17 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.mul"(%18, %42) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%5, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
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
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:2 = "neura.fused_op"(%3) <{frequency = 102 : i64, pattern_id = 6 : i64, pattern_name = "counter->load_indexed"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %12 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %13 = neura.load_indexed [%arg9, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8, %6, %7) <{frequency = 126 : i64, pattern_id = 8 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %12 = neura.load_indexed [%arg9, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.mul"(%12, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %10 to [%11, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
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
        %2:4 = "neura.fused_op"() <{frequency = 3 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %105 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %106 = "neura.add"(%105) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105, %106, %107, %109 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.fused_op"(%39, %12, %11) <{frequency = 39 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%105, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %107 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %arg12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.fused_op"(%10, %38, %42) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%9, %37) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%51, %36) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%50, %35, %54) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.fused_op"(%52, %56, %49, %34) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%48, %33, %58) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61:2 = "neura.fused_op"(%8, %32) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %62 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%61#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.fused_op"(%67, %31) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.fused_op"(%66, %30, %70) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.fused_op"(%68, %72, %65, %29) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.fused_op"(%64, %28, %74) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77:2 = "neura.fused_op"(%7, %27) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %78 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%77#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%83, %26) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%82, %25, %86) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.fused_op"(%84, %88, %81, %24) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.fused_op"(%80, %23, %90) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.fused_op"(%44, %40, %6, %22) <{frequency = 27 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%arg13, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.fused_op"(%5, %21, %94) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.fused_op"(%4, %20, %96) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%19, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %99 = "neura.fused_op"(%79, %18, %92) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %100 to [%17, %78 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %101 = "neura.fused_op"(%63, %16, %76) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %102 to [%15, %62 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %103 = "neura.fused_op"(%47, %14, %60) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %104 to [%13, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:4 = "neura.fused_op"() <{frequency = 3 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %105 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %106 = "neura.add"(%105) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105, %106, %107, %109 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.fused_op"(%39, %12, %11) <{frequency = 39 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%105, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %107 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %arg12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.fused_op"(%10, %38, %42) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%9, %37) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%51, %36) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%50, %35, %54) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.fused_op"(%52, %56, %49, %34) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%48, %33, %58) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61:2 = "neura.fused_op"(%8, %32) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %62 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%61#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.fused_op"(%67, %31) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.fused_op"(%66, %30, %70) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.fused_op"(%68, %72, %65, %29) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.fused_op"(%64, %28, %74) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77:2 = "neura.fused_op"(%7, %27) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %78 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%77#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%83, %26) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%82, %25, %86) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.fused_op"(%84, %88, %81, %24) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.fused_op"(%80, %23, %90) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.fused_op"(%44, %40, %6, %22) <{frequency = 27 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%arg13, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.fused_op"(%5, %21, %94) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.fused_op"(%4, %20, %96) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%19, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %99 = "neura.fused_op"(%79, %18, %92) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %100 to [%17, %78 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %101 = "neura.fused_op"(%63, %16, %76) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %102 to [%15, %62 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %103 = "neura.fused_op"(%47, %14, %60) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %104 to [%13, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %2:4 = "neura.fused_op"() <{frequency = 3 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %105 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %106 = "neura.add"(%105) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105, %106, %107, %109 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.fused_op"(%39, %12, %11) <{frequency = 39 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%105, %arg11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %107 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%107, %arg12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.fused_op"(%10, %38, %42) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%9, %37) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%51, %36) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%50, %35, %54) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.fused_op"(%52, %56, %49, %34) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%48, %33, %58) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61:2 = "neura.fused_op"(%8, %32) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %62 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%61#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.fused_op"(%67, %31) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.fused_op"(%66, %30, %70) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.fused_op"(%68, %72, %65, %29) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.fused_op"(%64, %28, %74) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77:2 = "neura.fused_op"(%7, %27) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = neura.load_indexed [%arg11, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%105, %106 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %78 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%77#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%77#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%83, %26) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %109 = neura.load_indexed [%108, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %110 = "neura.mul"(%109) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %111 = "neura.add"(%107, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%111 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%82, %25, %86) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%arg11, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.fused_op"(%84, %88, %81, %24) <{frequency = 9 : i64, pattern_id = 40 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg11, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %107 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %108 = neura.load_indexed [%arg13, %107 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %109 = "neura.mul"(%108) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %110 = "neura.add"(%106, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%110 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.fused_op"(%80, %23, %90) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.fused_op"(%44, %40, %6, %22) <{frequency = 27 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %105 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %106 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%arg13, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.mul"(%107) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%105, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.fused_op"(%5, %21, %94) <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %110 = neura.load_indexed [%109, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %111 = "neura.mul"(%110) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %112 = "neura.add"(%108, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%112 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.fused_op"(%4, %20, %96) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%19, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %99 = "neura.fused_op"(%79, %18, %92) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %100 to [%17, %78 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %101 = "neura.fused_op"(%63, %16, %76) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %102 to [%15, %62 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %103 = "neura.fused_op"(%47, %14, %60) <{frequency = 12 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %105 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %106 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %107 = neura.load_indexed [%106, %105 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %108 = "neura.add"(%arg12, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %109 = "neura.div"(%108) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%109 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %104 to [%13, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @corner_response(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %c4_i32 = arith.constant {latency = 1 : i32} 4 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) value_inputs(%c4_i32 : i32) [original_read_memrefs(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 4 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:3 = "neura.fused_op"(%3) <{frequency = 10 : i64, pattern_id = 23 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg14: !neura.data<index, i1>):
          %57 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %58 = neura.load_indexed [%57, %arg14 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %59 = neura.load_indexed [%57, %arg14 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %60 = "neura.mul"(%59, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %58, %60 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %15 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%4#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:4 = "neura.fused_op"(%18, %14) <{frequency = 6 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg14) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %60 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %61 = "neura.mul"(%60, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %62 = "neura.mul"(%58, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %63 = "neura.sub"(%62, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %58, %59, %63 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%19#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%19#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25:4 = "neura.fused_op"(%24, %13) <{frequency = 6 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg14) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %59 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %60 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %61 = "neura.mul"(%60, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %62 = "neura.mul"(%58, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %63 = "neura.sub"(%62, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %58, %59, %63 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%25#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%25#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31:2 = "neura.fused_op"(%30, %12) <{frequency = 298 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg14) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%arg15, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %32 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%31#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%31#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.fused_op"(%11, %34) <{frequency = 126 : i64, pattern_id = 8 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %57 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %58 = "neura.mul"(%57, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%10, %33, %36, %38) <{frequency = 3 : i64, pattern_id = 33 : i64, pattern_name = "load_indexed->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>):
          %57 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %58 = "neura.mul"(%arg16, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %59 = "neura.sub"(%58, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %59 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43:2 = "neura.fused_op"(%9, %42, %16) <{frequency = 126 : i64, pattern_id = 8 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %57 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %58 = "neura.mul"(%57, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%43#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%45, %17) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.fused_op"(%44, %15, %47) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %58 = "neura.mul"(%57, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %59 = "neura.mul"(%58) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %60 = "neura.sub"(%arg16, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %49 to [%8, %50 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %51 = "neura.fused_op"(%21, %22, %23) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %58 = "neura.mul"(%57, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %59 = "neura.mul"(%58) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %60 = "neura.sub"(%arg16, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %52 to [%7, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %53 = "neura.fused_op"(%27, %28, %29) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %58 = "neura.mul"(%57, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %59 = "neura.mul"(%58) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %60 = "neura.sub"(%arg16, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %54 to [%6, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %55 = "neura.fused_op"(%35, %40, %41) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %58 = "neura.mul"(%57, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %59 = "neura.mul"(%58) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %60 = "neura.sub"(%arg16, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%60 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%5, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg4, %arg5, %arg6 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
}

