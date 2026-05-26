module {
  func.func @sobel_x(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %310 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%310) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = "neura.add"(%312) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%310, %311, %312, %313 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
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
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29:3 = "neura.fused_op"(%22, %21) <{frequency = 96 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = neura.load_indexed [%314, %313 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %312, %315 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %30 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%29#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%29#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112:3 = "neura.fused_op"(%20, %109) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %113 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = "neura.data_mov"(%112#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%112#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119:3 = "neura.fused_op"(%19, %108) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %120 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%119#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%119#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126:3 = "neura.fused_op"(%18, %107) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %127 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%126#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.data_mov"(%126#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133:3 = "neura.fused_op"(%17, %106) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %134 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %135 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %136 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = "neura.data_mov"(%133#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%133#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140:3 = "neura.fused_op"(%16, %105) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %141 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%140#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%140#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147:3 = "neura.fused_op"(%15, %104) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %148 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %150 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %151 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %152 = "neura.data_mov"(%147#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%147#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154:3 = "neura.fused_op"(%14, %103) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %155 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%154#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %160 = "neura.data_mov"(%154#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161:3 = "neura.fused_op"(%13, %102) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %162 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %164 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %165 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = "neura.data_mov"(%161#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%161#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168:3 = "neura.fused_op"(%12, %101) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %169 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %170 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%168#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.data_mov"(%168#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175:3 = "neura.fused_op"(%11, %100) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %176 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %178 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = "neura.data_mov"(%175#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.data_mov"(%175#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182:3 = "neura.fused_op"(%10, %99) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %183 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %184 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %185 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %186 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %187 = "neura.data_mov"(%182#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%182#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189:3 = "neura.fused_op"(%9, %98) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %190 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %193 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = "neura.data_mov"(%189#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %195 = "neura.data_mov"(%189#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196:3 = "neura.fused_op"(%8, %97) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %197 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %198 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %199 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %200 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = "neura.data_mov"(%196#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%196#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203:3 = "neura.fused_op"(%7, %96) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %204 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %205 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%203#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%203#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %210 = "neura.fused_op"(%6, %95) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %211 = "neura.data_mov"(%210) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %212 = "neura.fused_op"(%5, %94) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %213 = "neura.data_mov"(%212) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %214 = "neura.fused_op"(%213, %110, %93, %4, %111, %211) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %215 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.fused_op"(%27, %92) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %217 = "neura.data_mov"(%216) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.fused_op"(%26, %91) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%218) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.fused_op"(%25, %90) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.fused_op"(%207, %89) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %223 = "neura.data_mov"(%222) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %224 = "neura.fused_op"(%206, %88) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %225 = "neura.data_mov"(%224) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %226 = "neura.fused_op"(%225, %208, %87, %205, %209, %223) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %227 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %228 = "neura.fused_op"(%200, %86) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %229 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %230 = "neura.fused_op"(%199, %85) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %231 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %232 = "neura.fused_op"(%231, %201, %84, %198, %202, %229) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%232) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.fused_op"(%193, %83) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.fused_op"(%192, %82) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %237 = "neura.data_mov"(%236) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.fused_op"(%237, %194, %81, %191, %195, %235) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%238) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %240 = "neura.fused_op"(%186, %80) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %241 = "neura.data_mov"(%240) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %242 = "neura.fused_op"(%185, %79) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %243 = "neura.data_mov"(%242) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.fused_op"(%243, %187, %78, %184, %188, %241) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.data_mov"(%244) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %246 = "neura.fused_op"(%179, %77) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %247 = "neura.data_mov"(%246) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.fused_op"(%178, %76) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %249 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.fused_op"(%249, %180, %75, %177, %181, %247) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.data_mov"(%250) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.fused_op"(%172, %74) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%252) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.fused_op"(%171, %73) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.fused_op"(%255, %173, %72, %170, %174, %253) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %257 = "neura.data_mov"(%256) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %258 = "neura.fused_op"(%165, %71) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %259 = "neura.data_mov"(%258) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %260 = "neura.fused_op"(%164, %70) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %261 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %262 = "neura.fused_op"(%261, %166, %69, %163, %167, %259) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %263 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %264 = "neura.fused_op"(%158, %68) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %265 = "neura.data_mov"(%264) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %266 = "neura.fused_op"(%157, %67) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%266) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.fused_op"(%267, %159, %66, %156, %160, %265) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.fused_op"(%151, %65) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %271 = "neura.data_mov"(%270) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.fused_op"(%150, %64) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%272) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %274 = "neura.fused_op"(%273, %152, %63, %149, %153, %271) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %275 = "neura.data_mov"(%274) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %276 = "neura.fused_op"(%144, %62) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %277 = "neura.data_mov"(%276) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %278 = "neura.fused_op"(%143, %61) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %279 = "neura.data_mov"(%278) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %280 = "neura.fused_op"(%279, %145, %60, %142, %146, %277) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %281 = "neura.data_mov"(%280) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %282 = "neura.fused_op"(%137, %59) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %283 = "neura.data_mov"(%282) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %284 = "neura.fused_op"(%136, %58) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %285 = "neura.data_mov"(%284) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %286 = "neura.fused_op"(%285, %138, %57, %135, %139, %283) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %287 = "neura.data_mov"(%286) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %288 = "neura.fused_op"(%130, %56) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %289 = "neura.data_mov"(%288) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %290 = "neura.fused_op"(%129, %55) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %291 = "neura.data_mov"(%290) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %292 = "neura.fused_op"(%291, %131, %54, %128, %132, %289) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %293 = "neura.data_mov"(%292) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %294 = "neura.fused_op"(%123, %53) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %295 = "neura.data_mov"(%294) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %296 = "neura.fused_op"(%122, %52) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %297 = "neura.data_mov"(%296) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %298 = "neura.fused_op"(%297, %124, %51, %121, %125, %295) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %299 = "neura.data_mov"(%298) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %300 = "neura.fused_op"(%116, %50) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %301 = "neura.data_mov"(%300) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %302 = "neura.fused_op"(%115, %49) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %303 = "neura.data_mov"(%302) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %304 = "neura.fused_op"(%303, %117, %48, %114, %118, %301) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %305 = "neura.data_mov"(%304) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %215 to [%47, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %305 to [%46, %113 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %299 to [%45, %120 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %293 to [%44, %127 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %287 to [%43, %134 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %281 to [%42, %141 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %275 to [%41, %148 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %269 to [%40, %155 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %263 to [%39, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %257 to [%38, %169 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %251 to [%37, %176 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %245 to [%36, %183 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %239 to [%35, %190 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %233 to [%34, %197 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %227 to [%33, %204 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %306 = "neura.fused_op"(%32, %28) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = neura.load_indexed [%310, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%311 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %307 = "neura.data_mov"(%306) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %308 = "neura.fused_op"(%221, %307, %31, %24, %217, %219) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %309 = "neura.data_mov"(%308) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %309 to [%30, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:3 = "neura.fused_op"(%3) <{frequency = 2 : i64, pattern_id = 41 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:add->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %21 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %22 = "neura.add"(%21) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%21, %25, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%4#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%8, %11) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%7, %14) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.fused_op"(%16, %10, %17, %6, %9, %13) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %21 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%21, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.mul"(%27) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%25, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %19 to [%20, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 30 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %310 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%310) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = "neura.add"(%312) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%310, %311, %312, %313 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
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
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29:3 = "neura.fused_op"(%22, %21) <{frequency = 96 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = neura.load_indexed [%314, %313 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %312, %315 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %30 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%29#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%29#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112:3 = "neura.fused_op"(%20, %109) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %113 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = "neura.data_mov"(%112#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = "neura.data_mov"(%112#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%112#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119:3 = "neura.fused_op"(%19, %108) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %120 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%119#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%119#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%119#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126:3 = "neura.fused_op"(%18, %107) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %127 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%126#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%126#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.data_mov"(%126#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133:3 = "neura.fused_op"(%17, %106) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %134 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %135 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %136 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = "neura.data_mov"(%133#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = "neura.data_mov"(%133#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%133#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140:3 = "neura.fused_op"(%16, %105) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %141 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%140#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%140#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%140#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147:3 = "neura.fused_op"(%15, %104) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %148 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %150 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %151 = "neura.data_mov"(%147#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %152 = "neura.data_mov"(%147#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%147#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154:3 = "neura.fused_op"(%14, %103) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %155 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%154#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%154#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %160 = "neura.data_mov"(%154#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161:3 = "neura.fused_op"(%13, %102) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %162 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %164 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %165 = "neura.data_mov"(%161#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = "neura.data_mov"(%161#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%161#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168:3 = "neura.fused_op"(%12, %101) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %169 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %170 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%168#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%168#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.data_mov"(%168#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175:3 = "neura.fused_op"(%11, %100) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %176 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %178 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%175#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = "neura.data_mov"(%175#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.data_mov"(%175#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182:3 = "neura.fused_op"(%10, %99) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %183 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %184 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %185 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %186 = "neura.data_mov"(%182#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %187 = "neura.data_mov"(%182#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%182#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189:3 = "neura.fused_op"(%9, %98) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %190 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %193 = "neura.data_mov"(%189#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = "neura.data_mov"(%189#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %195 = "neura.data_mov"(%189#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196:3 = "neura.fused_op"(%8, %97) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %197 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %198 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %199 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %200 = "neura.data_mov"(%196#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = "neura.data_mov"(%196#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%196#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203:3 = "neura.fused_op"(%7, %96) <{frequency = 84 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%310) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %313 = neura.load_indexed [%312, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %314 = "neura.add"(%310) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %315 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%315, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%310, %313, %316 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %204 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %205 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.data_mov"(%203#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%203#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%203#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %210 = "neura.fused_op"(%6, %95) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %211 = "neura.data_mov"(%210) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %212 = "neura.fused_op"(%5, %94) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %213 = "neura.data_mov"(%212) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %214 = "neura.fused_op"(%211, %110, %4, %93, %111, %213) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %215 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.fused_op"(%27, %92) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %217 = "neura.data_mov"(%216) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.fused_op"(%26, %91) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%218) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.fused_op"(%25, %90) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.fused_op"(%207, %89) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %223 = "neura.data_mov"(%222) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %224 = "neura.fused_op"(%206, %88) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %225 = "neura.data_mov"(%224) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %226 = "neura.fused_op"(%223, %208, %205, %87, %209, %225) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %227 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %228 = "neura.fused_op"(%200, %86) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %229 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %230 = "neura.fused_op"(%199, %85) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %231 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %232 = "neura.fused_op"(%229, %201, %198, %84, %202, %231) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%232) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.fused_op"(%193, %83) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.fused_op"(%192, %82) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %237 = "neura.data_mov"(%236) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.fused_op"(%235, %194, %191, %81, %195, %237) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%238) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %240 = "neura.fused_op"(%186, %80) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %241 = "neura.data_mov"(%240) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %242 = "neura.fused_op"(%185, %79) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %243 = "neura.data_mov"(%242) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.fused_op"(%241, %187, %184, %78, %188, %243) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.data_mov"(%244) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %246 = "neura.fused_op"(%179, %77) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %247 = "neura.data_mov"(%246) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.fused_op"(%178, %76) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %249 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.fused_op"(%247, %180, %177, %75, %181, %249) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.data_mov"(%250) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.fused_op"(%172, %74) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%252) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.fused_op"(%171, %73) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.fused_op"(%253, %173, %170, %72, %174, %255) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %257 = "neura.data_mov"(%256) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %258 = "neura.fused_op"(%165, %71) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %259 = "neura.data_mov"(%258) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %260 = "neura.fused_op"(%164, %70) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %261 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %262 = "neura.fused_op"(%259, %166, %163, %69, %167, %261) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %263 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %264 = "neura.fused_op"(%158, %68) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %265 = "neura.data_mov"(%264) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %266 = "neura.fused_op"(%157, %67) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%266) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.fused_op"(%265, %159, %156, %66, %160, %267) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.fused_op"(%151, %65) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %271 = "neura.data_mov"(%270) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.fused_op"(%150, %64) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%272) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %274 = "neura.fused_op"(%271, %152, %149, %63, %153, %273) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %275 = "neura.data_mov"(%274) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %276 = "neura.fused_op"(%144, %62) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %277 = "neura.data_mov"(%276) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %278 = "neura.fused_op"(%143, %61) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %279 = "neura.data_mov"(%278) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %280 = "neura.fused_op"(%277, %145, %142, %60, %146, %279) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %281 = "neura.data_mov"(%280) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %282 = "neura.fused_op"(%137, %59) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %283 = "neura.data_mov"(%282) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %284 = "neura.fused_op"(%136, %58) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %285 = "neura.data_mov"(%284) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %286 = "neura.fused_op"(%283, %138, %135, %57, %139, %285) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %287 = "neura.data_mov"(%286) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %288 = "neura.fused_op"(%130, %56) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %289 = "neura.data_mov"(%288) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %290 = "neura.fused_op"(%129, %55) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %291 = "neura.data_mov"(%290) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %292 = "neura.fused_op"(%289, %131, %128, %54, %132, %291) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %293 = "neura.data_mov"(%292) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %294 = "neura.fused_op"(%123, %53) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %295 = "neura.data_mov"(%294) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %296 = "neura.fused_op"(%122, %52) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %297 = "neura.data_mov"(%296) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %298 = "neura.fused_op"(%295, %124, %121, %51, %125, %297) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %299 = "neura.data_mov"(%298) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %300 = "neura.fused_op"(%116, %50) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %301 = "neura.data_mov"(%300) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %302 = "neura.fused_op"(%115, %49) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%311, %310 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%312 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %303 = "neura.data_mov"(%302) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %304 = "neura.fused_op"(%301, %117, %114, %48, %118, %303) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %305 = "neura.data_mov"(%304) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %215 to [%47, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %305 to [%46, %113 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %299 to [%45, %120 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %293 to [%44, %127 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %287 to [%43, %134 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %281 to [%42, %141 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %275 to [%41, %148 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %269 to [%40, %155 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %263 to [%39, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %257 to [%38, %169 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %251 to [%37, %176 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %245 to [%36, %183 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %239 to [%35, %190 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %233 to [%34, %197 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %227 to [%33, %204 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %306 = "neura.fused_op"(%32, %28) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %310 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %311 = neura.load_indexed [%310, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%311 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %307 = "neura.data_mov"(%306) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %308 = "neura.fused_op"(%219, %307, %24, %31, %217, %221) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %310 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %311 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %312 = neura.load_indexed [%arg9, %311 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %313 = "neura.mul"(%312) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %314 = "neura.add"(%310, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %315 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %316 = neura.load_indexed [%arg9, %315 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %317 = "neura.mul"(%316) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %318 = "neura.sub"(%314, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %319 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %320 = "neura.add"(%318, %319) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%320 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %309 = "neura.data_mov"(%308) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %309 to [%30, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:3 = "neura.fused_op"(%3) <{frequency = 2 : i64, pattern_id = 41 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:add->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %21 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %22 = "neura.add"(%21) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = "neura.add"(%21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%26, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%21, %25, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%4#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.fused_op"(%8, %11) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%7, %14) <{frequency = 300 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.fused_op"(%13, %10, %6, %17, %9, %16) <{frequency = 34 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %21 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %22 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%arg9, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%23) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %25 = "neura.add"(%21, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %27 = neura.load_indexed [%arg9, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %28 = "neura.mul"(%27) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %29 = "neura.sub"(%25, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %31 = "neura.add"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%31 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %19 to [%20, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:5 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:counter->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
          %93 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : !neura.data<index, i1>
          %94 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %95 = neura.load_indexed [%94, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %96 = "neura.mul"(%95, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %97 = "neura.add"(%93) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %98 = neura.load_indexed [%94, %97 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%98, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %94, %96, %97, %99 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%17, %47) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54:2 = "neura.fused_op"(%16, %46) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %55 = "neura.data_mov"(%54#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%54#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57:2 = "neura.fused_op"(%15, %45) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %58 = "neura.data_mov"(%57#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%57#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60:2 = "neura.fused_op"(%14, %44) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %61 = "neura.data_mov"(%60#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%60#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63:2 = "neura.fused_op"(%13, %43) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %64 = "neura.data_mov"(%63#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66:2 = "neura.fused_op"(%12, %42) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %67 = "neura.data_mov"(%66#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%66#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69:2 = "neura.fused_op"(%11, %41) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %70 = "neura.data_mov"(%69#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%69#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72:2 = "neura.fused_op"(%10, %40) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %73 = "neura.data_mov"(%72#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%72#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75:2 = "neura.fused_op"(%9, %39) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %76 = "neura.data_mov"(%75#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%75#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78:2 = "neura.fused_op"(%8, %38) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %79 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%78#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81:2 = "neura.fused_op"(%7, %37) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %82 = "neura.data_mov"(%81#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%81#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84:2 = "neura.fused_op"(%6, %36) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %85 = "neura.data_mov"(%84#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%84#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87:2 = "neura.fused_op"(%5, %35) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %88 = "neura.data_mov"(%87#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%87#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90:2 = "neura.fused_op"(%4, %34) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %91 = "neura.data_mov"(%90#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %48 to [%33, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %92 to [%32, %91 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %89 to [%31, %88 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %86 to [%30, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %83 to [%29, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %80 to [%28, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%27, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %74 to [%26, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%25, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %68 to [%24, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%23, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %62 to [%22, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%21, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %56 to [%20, %55 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%19, %52 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%18, %49 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:5 = "neura.fused_op"() <{frequency = 60 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:counter->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
          %93 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : !neura.data<index, i1>
          %94 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %95 = neura.load_indexed [%94, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %96 = "neura.mul"(%95, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %97 = "neura.add"(%93) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %98 = neura.load_indexed [%94, %97 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%98, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %94, %96, %97, %99 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%17, %47) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54:2 = "neura.fused_op"(%16, %46) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %55 = "neura.data_mov"(%54#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%54#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57:2 = "neura.fused_op"(%15, %45) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %58 = "neura.data_mov"(%57#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%57#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60:2 = "neura.fused_op"(%14, %44) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %61 = "neura.data_mov"(%60#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%60#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63:2 = "neura.fused_op"(%13, %43) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %64 = "neura.data_mov"(%63#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66:2 = "neura.fused_op"(%12, %42) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %67 = "neura.data_mov"(%66#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%66#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69:2 = "neura.fused_op"(%11, %41) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %70 = "neura.data_mov"(%69#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%69#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72:2 = "neura.fused_op"(%10, %40) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %73 = "neura.data_mov"(%72#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%72#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75:2 = "neura.fused_op"(%9, %39) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %76 = "neura.data_mov"(%75#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%75#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78:2 = "neura.fused_op"(%8, %38) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %79 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%78#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81:2 = "neura.fused_op"(%7, %37) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %82 = "neura.data_mov"(%81#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%81#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84:2 = "neura.fused_op"(%6, %36) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %85 = "neura.data_mov"(%84#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%84#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87:2 = "neura.fused_op"(%5, %35) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %88 = "neura.data_mov"(%87#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%87#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90:2 = "neura.fused_op"(%4, %34) <{frequency = 75 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %93 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %94 = neura.load_indexed [%arg7, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %95 = "neura.mul"(%94, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%93, %95 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %91 = "neura.data_mov"(%90#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %48 to [%33, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %92 to [%32, %91 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %89 to [%31, %88 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %86 to [%30, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %83 to [%29, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %80 to [%28, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%27, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %74 to [%26, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%25, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %68 to [%24, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%23, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %62 to [%22, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%21, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %56 to [%20, %55 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%19, %52 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%18, %49 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:counter->fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
          %96 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 16 : index, upper_bound = 49 : index} : !neura.data<index, i1>
          %97 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %98 = neura.load_indexed [%97, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = neura.load_indexed [%97, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %100 = "neura.mul"(%99, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %97, %100 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%18, %49) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54:2 = "neura.fused_op"(%17, %48) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %55 = "neura.data_mov"(%54#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%54#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57:2 = "neura.fused_op"(%16, %47) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %58 = "neura.data_mov"(%57#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%57#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60:2 = "neura.fused_op"(%15, %46) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %61 = "neura.data_mov"(%60#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%60#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63:2 = "neura.fused_op"(%14, %45) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %64 = "neura.data_mov"(%63#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66:2 = "neura.fused_op"(%13, %44) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %67 = "neura.data_mov"(%66#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%66#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69:2 = "neura.fused_op"(%12, %43) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %70 = "neura.data_mov"(%69#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%69#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72:2 = "neura.fused_op"(%11, %42) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %73 = "neura.data_mov"(%72#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%72#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75:2 = "neura.fused_op"(%10, %41) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %76 = "neura.data_mov"(%75#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%75#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78:2 = "neura.fused_op"(%9, %40) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %79 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%78#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81:2 = "neura.fused_op"(%8, %39) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %82 = "neura.data_mov"(%81#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%81#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84:2 = "neura.fused_op"(%7, %38) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %85 = "neura.data_mov"(%84#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%84#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87:2 = "neura.fused_op"(%6, %37) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %88 = "neura.data_mov"(%87#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%87#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90:2 = "neura.fused_op"(%5, %36) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %91 = "neura.data_mov"(%90#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93:2 = "neura.fused_op"(%4, %35) <{frequency = 30 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %96 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %97 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %98 = neura.load_indexed [%arg10, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%96, %99 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %94 = "neura.data_mov"(%93#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%93#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%34, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %95 to [%33, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %92 to [%32, %91 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %89 to [%31, %88 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %86 to [%30, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %83 to [%29, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %80 to [%28, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%27, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %74 to [%26, %73 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%25, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %68 to [%24, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%23, %64 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %62 to [%22, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%21, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %56 to [%20, %55 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%19, %52 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
    }
    %dependency_read_out_0:2, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out#0, %dependency_read_out#1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:counter->fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %7 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 49 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%6, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %9 = neura.load_indexed [%6, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%6, %7, %10 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %413 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : !neura.data<index, i1>
          %414 = "neura.add"(%413) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %416 = neura.load_indexed [%415, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%415) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %419 = neura.load_indexed [%418, %414 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %420 = "neura.add"(%415) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %421 = neura.load_indexed [%420, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %422 = "neura.mul"(%421) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %423 = "neura.add"(%419, %422) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%413, %415, %417, %423 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %13 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %113 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %118 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %119 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %120 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %125 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.fused_op"(%22, %132, %134) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137:2 = "neura.fused_op"(%21, %131) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %138 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.fused_op"(%143, %130) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.fused_op"(%142, %129, %146) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.fused_op"(%144, %148, %141, %128) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.fused_op"(%140, %127, %150) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153:2 = "neura.fused_op"(%20, %126) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %154 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.fused_op"(%159, %125) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.fused_op"(%158, %124, %162) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.fused_op"(%160, %164, %157, %123) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.fused_op"(%156, %122, %166) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169:2 = "neura.fused_op"(%19, %121) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %170 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %176 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.fused_op"(%175, %120) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.fused_op"(%174, %119, %178) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.fused_op"(%176, %180, %173, %118) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%181) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%172, %117, %182) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185:2 = "neura.fused_op"(%18, %116) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %186 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %187 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %188 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %189 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = "neura.data_mov"(%185#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %193 = "neura.fused_op"(%191, %115) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %195 = "neura.fused_op"(%190, %114, %194) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %197 = "neura.fused_op"(%192, %196, %189, %113) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.fused_op"(%188, %112, %198) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201:2 = "neura.fused_op"(%17, %111) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %202 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %203 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %204 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %205 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%201#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.fused_op"(%207, %110) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %210 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %211 = "neura.fused_op"(%206, %109, %210) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %212 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %213 = "neura.fused_op"(%208, %212, %205, %108) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %214 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %215 = "neura.fused_op"(%204, %107, %214) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%215) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217:2 = "neura.fused_op"(%16, %106) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %218 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %219 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %221 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %222 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %223 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.data_mov"(%217#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %225 = "neura.fused_op"(%223, %105) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%225) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %227 = "neura.fused_op"(%222, %104, %226) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %228 = "neura.data_mov"(%227) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %229 = "neura.fused_op"(%224, %228, %221, %103) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %230 = "neura.data_mov"(%229) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %231 = "neura.fused_op"(%220, %102, %230) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %232 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233:2 = "neura.fused_op"(%15, %101) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %234 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %235 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %236 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %237 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %238 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %239 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %240 = "neura.data_mov"(%233#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %241 = "neura.fused_op"(%239, %100) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %242 = "neura.data_mov"(%241) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %243 = "neura.fused_op"(%238, %99, %242) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.fused_op"(%240, %244, %237, %98) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %246 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.fused_op"(%236, %97, %246) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%247) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249:2 = "neura.fused_op"(%14, %96) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %250 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %251 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %252 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %253 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %254 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %255 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %256 = "neura.data_mov"(%249#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %257 = "neura.fused_op"(%255, %95) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %258 = "neura.data_mov"(%257) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %259 = "neura.fused_op"(%254, %94, %258) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %260 = "neura.data_mov"(%259) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %261 = "neura.fused_op"(%256, %260, %253, %93) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %262 = "neura.data_mov"(%261) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %263 = "neura.fused_op"(%252, %92, %262) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %264 = "neura.data_mov"(%263) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %265:2 = "neura.fused_op"(%13, %91) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %266 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %267 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %268 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %269 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %270 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %271 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %272 = "neura.data_mov"(%265#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.fused_op"(%271, %90) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %274 = "neura.data_mov"(%273) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %275 = "neura.fused_op"(%270, %89, %274) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %276 = "neura.data_mov"(%275) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %277 = "neura.fused_op"(%272, %276, %269, %88) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %278 = "neura.data_mov"(%277) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %279 = "neura.fused_op"(%268, %87, %278) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %280 = "neura.data_mov"(%279) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %281:2 = "neura.fused_op"(%12, %86) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %282 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %283 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %284 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %285 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %286 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %287 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %288 = "neura.data_mov"(%281#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %289 = "neura.fused_op"(%287, %85) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %290 = "neura.data_mov"(%289) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %291 = "neura.fused_op"(%286, %84, %290) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %292 = "neura.data_mov"(%291) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %293 = "neura.fused_op"(%288, %292, %285, %83) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %294 = "neura.data_mov"(%293) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %295 = "neura.fused_op"(%284, %82, %294) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %296 = "neura.data_mov"(%295) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %297:2 = "neura.fused_op"(%11, %81) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %298 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %299 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %300 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %301 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %302 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %303 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %304 = "neura.data_mov"(%297#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %305 = "neura.fused_op"(%303, %80) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %306 = "neura.data_mov"(%305) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %307 = "neura.fused_op"(%302, %79, %306) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %308 = "neura.data_mov"(%307) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %309 = "neura.fused_op"(%304, %308, %301, %78) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %310 = "neura.data_mov"(%309) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %311 = "neura.fused_op"(%300, %77, %310) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %312 = "neura.data_mov"(%311) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %313:2 = "neura.fused_op"(%10, %76) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %314 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %315 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %316 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %317 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %318 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %319 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %320 = "neura.data_mov"(%313#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %321 = "neura.fused_op"(%319, %75) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %322 = "neura.data_mov"(%321) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %323 = "neura.fused_op"(%318, %74, %322) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %324 = "neura.data_mov"(%323) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %325 = "neura.fused_op"(%320, %324, %317, %73) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %326 = "neura.data_mov"(%325) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %327 = "neura.fused_op"(%316, %72, %326) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %328 = "neura.data_mov"(%327) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %329:2 = "neura.fused_op"(%9, %71) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %330 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %331 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %332 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %333 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %334 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %335 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %336 = "neura.data_mov"(%329#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %337 = "neura.fused_op"(%335, %70) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %338 = "neura.data_mov"(%337) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %339 = "neura.fused_op"(%334, %69, %338) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %340 = "neura.data_mov"(%339) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %341 = "neura.fused_op"(%336, %340, %333, %68) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %342 = "neura.data_mov"(%341) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %343 = "neura.fused_op"(%332, %67, %342) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %344 = "neura.data_mov"(%343) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %345:2 = "neura.fused_op"(%8, %66) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %346 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %347 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %348 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %349 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %350 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %351 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %352 = "neura.data_mov"(%345#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %353 = "neura.fused_op"(%351, %65) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %354 = "neura.data_mov"(%353) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %355 = "neura.fused_op"(%350, %64, %354) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %356 = "neura.data_mov"(%355) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %357 = "neura.fused_op"(%352, %356, %349, %63) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %358 = "neura.data_mov"(%357) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %359 = "neura.fused_op"(%348, %62, %358) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %360 = "neura.data_mov"(%359) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %361:2 = "neura.fused_op"(%7, %61) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %362 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %363 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %364 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %365 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %366 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %367 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %368 = "neura.data_mov"(%361#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %369 = "neura.fused_op"(%367, %60) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %370 = "neura.data_mov"(%369) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %371 = "neura.fused_op"(%366, %59, %370) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %372 = "neura.data_mov"(%371) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %373 = "neura.fused_op"(%368, %372, %365, %58) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %374 = "neura.data_mov"(%373) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %375 = "neura.fused_op"(%364, %57, %374) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %376 = "neura.data_mov"(%375) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %377 = "neura.fused_op"(%136, %133, %6, %56) <{frequency = 108 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%arg13, %414 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.mul"(%415) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%413, %416) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %378 = "neura.data_mov"(%377) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %379 = "neura.fused_op"(%5, %55, %378) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %380 = "neura.data_mov"(%379) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %381 = "neura.fused_op"(%4, %54, %380) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %382 = "neura.data_mov"(%381) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %382 to [%53, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %383 = "neura.fused_op"(%363, %52, %376) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %384 = "neura.data_mov"(%383) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %384 to [%51, %362 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %385 = "neura.fused_op"(%347, %50, %360) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %386 = "neura.data_mov"(%385) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %386 to [%49, %346 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %387 = "neura.fused_op"(%331, %48, %344) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %388 = "neura.data_mov"(%387) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %388 to [%47, %330 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %389 = "neura.fused_op"(%315, %46, %328) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %390 = "neura.data_mov"(%389) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %390 to [%45, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %391 = "neura.fused_op"(%299, %44, %312) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %392 = "neura.data_mov"(%391) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %392 to [%43, %298 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %393 = "neura.fused_op"(%283, %42, %296) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %394 = "neura.data_mov"(%393) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %394 to [%41, %282 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %395 = "neura.fused_op"(%267, %40, %280) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %396 = "neura.data_mov"(%395) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %396 to [%39, %266 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %397 = "neura.fused_op"(%251, %38, %264) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %398 = "neura.data_mov"(%397) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %398 to [%37, %250 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %399 = "neura.fused_op"(%235, %36, %248) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %400 = "neura.data_mov"(%399) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %400 to [%35, %234 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %401 = "neura.fused_op"(%219, %34, %232) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %402 = "neura.data_mov"(%401) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %402 to [%33, %218 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %403 = "neura.fused_op"(%203, %32, %216) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %404 = "neura.data_mov"(%403) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %404 to [%31, %202 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %405 = "neura.fused_op"(%187, %30, %200) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %406 = "neura.data_mov"(%405) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %406 to [%29, %186 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %407 = "neura.fused_op"(%171, %28, %184) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %408 = "neura.data_mov"(%407) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %408 to [%27, %170 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %409 = "neura.fused_op"(%155, %26, %168) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %410 = "neura.data_mov"(%409) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %410 to [%25, %154 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %411 = "neura.fused_op"(%139, %24, %152) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %412 = "neura.data_mov"(%411) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %412 to [%23, %138 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %24 = "neura.add"(%23) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%25) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.add"(%25) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25, %27, %33 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%7, %12, %14) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg11, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%16, %13, %6, %11) <{frequency = 108 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %23 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg13, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%5, %10, %18) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%27, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%4, %9, %20) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.div"(%26) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%8, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg1 : memref<64x64xi32>) dependency_write_in(%arg4 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %413 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : !neura.data<index, i1>
          %414 = "neura.add"(%413) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %416 = neura.load_indexed [%415, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%415) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %419 = neura.load_indexed [%418, %414 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %420 = "neura.add"(%415) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %421 = neura.load_indexed [%420, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %422 = "neura.mul"(%421) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %423 = "neura.add"(%419, %422) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%413, %415, %417, %423 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %13 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %113 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %118 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %119 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %120 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %125 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.fused_op"(%22, %132, %134) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137:2 = "neura.fused_op"(%21, %131) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %138 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.fused_op"(%143, %130) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.fused_op"(%142, %129, %146) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.fused_op"(%144, %148, %141, %128) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.fused_op"(%140, %127, %150) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153:2 = "neura.fused_op"(%20, %126) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %154 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.fused_op"(%159, %125) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.fused_op"(%158, %124, %162) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.fused_op"(%160, %164, %157, %123) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.fused_op"(%156, %122, %166) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169:2 = "neura.fused_op"(%19, %121) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %170 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %176 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.fused_op"(%175, %120) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.fused_op"(%174, %119, %178) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.fused_op"(%176, %180, %173, %118) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%181) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%172, %117, %182) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185:2 = "neura.fused_op"(%18, %116) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %186 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %187 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %188 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %189 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = "neura.data_mov"(%185#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %193 = "neura.fused_op"(%191, %115) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %195 = "neura.fused_op"(%190, %114, %194) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %197 = "neura.fused_op"(%192, %196, %189, %113) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.fused_op"(%188, %112, %198) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201:2 = "neura.fused_op"(%17, %111) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %202 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %203 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %204 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %205 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%201#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.fused_op"(%207, %110) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %210 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %211 = "neura.fused_op"(%206, %109, %210) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %212 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %213 = "neura.fused_op"(%208, %212, %205, %108) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %214 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %215 = "neura.fused_op"(%204, %107, %214) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%215) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217:2 = "neura.fused_op"(%16, %106) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %218 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %219 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %221 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %222 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %223 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.data_mov"(%217#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %225 = "neura.fused_op"(%223, %105) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%225) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %227 = "neura.fused_op"(%222, %104, %226) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %228 = "neura.data_mov"(%227) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %229 = "neura.fused_op"(%224, %228, %221, %103) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %230 = "neura.data_mov"(%229) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %231 = "neura.fused_op"(%220, %102, %230) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %232 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233:2 = "neura.fused_op"(%15, %101) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %234 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %235 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %236 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %237 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %238 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %239 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %240 = "neura.data_mov"(%233#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %241 = "neura.fused_op"(%239, %100) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %242 = "neura.data_mov"(%241) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %243 = "neura.fused_op"(%238, %99, %242) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.fused_op"(%240, %244, %237, %98) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %246 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.fused_op"(%236, %97, %246) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%247) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249:2 = "neura.fused_op"(%14, %96) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %250 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %251 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %252 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %253 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %254 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %255 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %256 = "neura.data_mov"(%249#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %257 = "neura.fused_op"(%255, %95) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %258 = "neura.data_mov"(%257) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %259 = "neura.fused_op"(%254, %94, %258) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %260 = "neura.data_mov"(%259) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %261 = "neura.fused_op"(%256, %260, %253, %93) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %262 = "neura.data_mov"(%261) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %263 = "neura.fused_op"(%252, %92, %262) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %264 = "neura.data_mov"(%263) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %265:2 = "neura.fused_op"(%13, %91) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %266 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %267 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %268 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %269 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %270 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %271 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %272 = "neura.data_mov"(%265#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.fused_op"(%271, %90) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %274 = "neura.data_mov"(%273) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %275 = "neura.fused_op"(%270, %89, %274) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %276 = "neura.data_mov"(%275) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %277 = "neura.fused_op"(%272, %276, %269, %88) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %278 = "neura.data_mov"(%277) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %279 = "neura.fused_op"(%268, %87, %278) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %280 = "neura.data_mov"(%279) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %281:2 = "neura.fused_op"(%12, %86) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %282 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %283 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %284 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %285 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %286 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %287 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %288 = "neura.data_mov"(%281#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %289 = "neura.fused_op"(%287, %85) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %290 = "neura.data_mov"(%289) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %291 = "neura.fused_op"(%286, %84, %290) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %292 = "neura.data_mov"(%291) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %293 = "neura.fused_op"(%288, %292, %285, %83) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %294 = "neura.data_mov"(%293) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %295 = "neura.fused_op"(%284, %82, %294) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %296 = "neura.data_mov"(%295) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %297:2 = "neura.fused_op"(%11, %81) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %298 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %299 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %300 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %301 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %302 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %303 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %304 = "neura.data_mov"(%297#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %305 = "neura.fused_op"(%303, %80) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %306 = "neura.data_mov"(%305) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %307 = "neura.fused_op"(%302, %79, %306) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %308 = "neura.data_mov"(%307) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %309 = "neura.fused_op"(%304, %308, %301, %78) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %310 = "neura.data_mov"(%309) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %311 = "neura.fused_op"(%300, %77, %310) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %312 = "neura.data_mov"(%311) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %313:2 = "neura.fused_op"(%10, %76) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %314 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %315 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %316 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %317 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %318 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %319 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %320 = "neura.data_mov"(%313#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %321 = "neura.fused_op"(%319, %75) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %322 = "neura.data_mov"(%321) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %323 = "neura.fused_op"(%318, %74, %322) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %324 = "neura.data_mov"(%323) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %325 = "neura.fused_op"(%320, %324, %317, %73) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %326 = "neura.data_mov"(%325) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %327 = "neura.fused_op"(%316, %72, %326) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %328 = "neura.data_mov"(%327) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %329:2 = "neura.fused_op"(%9, %71) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %330 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %331 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %332 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %333 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %334 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %335 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %336 = "neura.data_mov"(%329#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %337 = "neura.fused_op"(%335, %70) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %338 = "neura.data_mov"(%337) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %339 = "neura.fused_op"(%334, %69, %338) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %340 = "neura.data_mov"(%339) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %341 = "neura.fused_op"(%336, %340, %333, %68) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %342 = "neura.data_mov"(%341) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %343 = "neura.fused_op"(%332, %67, %342) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %344 = "neura.data_mov"(%343) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %345:2 = "neura.fused_op"(%8, %66) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %346 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %347 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %348 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %349 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %350 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %351 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %352 = "neura.data_mov"(%345#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %353 = "neura.fused_op"(%351, %65) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %354 = "neura.data_mov"(%353) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %355 = "neura.fused_op"(%350, %64, %354) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %356 = "neura.data_mov"(%355) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %357 = "neura.fused_op"(%352, %356, %349, %63) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %358 = "neura.data_mov"(%357) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %359 = "neura.fused_op"(%348, %62, %358) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %360 = "neura.data_mov"(%359) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %361:2 = "neura.fused_op"(%7, %61) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %362 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %363 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %364 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %365 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %366 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %367 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %368 = "neura.data_mov"(%361#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %369 = "neura.fused_op"(%367, %60) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %370 = "neura.data_mov"(%369) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %371 = "neura.fused_op"(%366, %59, %370) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %372 = "neura.data_mov"(%371) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %373 = "neura.fused_op"(%368, %372, %365, %58) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %374 = "neura.data_mov"(%373) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %375 = "neura.fused_op"(%364, %57, %374) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %376 = "neura.data_mov"(%375) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %377 = "neura.fused_op"(%136, %133, %6, %56) <{frequency = 108 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%arg13, %414 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.mul"(%415) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%413, %416) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %378 = "neura.data_mov"(%377) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %379 = "neura.fused_op"(%5, %55, %378) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %380 = "neura.data_mov"(%379) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %381 = "neura.fused_op"(%4, %54, %380) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %382 = "neura.data_mov"(%381) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %382 to [%53, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %383 = "neura.fused_op"(%363, %52, %376) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %384 = "neura.data_mov"(%383) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %384 to [%51, %362 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %385 = "neura.fused_op"(%347, %50, %360) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %386 = "neura.data_mov"(%385) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %386 to [%49, %346 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %387 = "neura.fused_op"(%331, %48, %344) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %388 = "neura.data_mov"(%387) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %388 to [%47, %330 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %389 = "neura.fused_op"(%315, %46, %328) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %390 = "neura.data_mov"(%389) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %390 to [%45, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %391 = "neura.fused_op"(%299, %44, %312) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %392 = "neura.data_mov"(%391) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %392 to [%43, %298 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %393 = "neura.fused_op"(%283, %42, %296) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %394 = "neura.data_mov"(%393) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %394 to [%41, %282 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %395 = "neura.fused_op"(%267, %40, %280) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %396 = "neura.data_mov"(%395) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %396 to [%39, %266 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %397 = "neura.fused_op"(%251, %38, %264) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %398 = "neura.data_mov"(%397) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %398 to [%37, %250 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %399 = "neura.fused_op"(%235, %36, %248) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %400 = "neura.data_mov"(%399) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %400 to [%35, %234 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %401 = "neura.fused_op"(%219, %34, %232) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %402 = "neura.data_mov"(%401) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %402 to [%33, %218 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %403 = "neura.fused_op"(%203, %32, %216) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %404 = "neura.data_mov"(%403) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %404 to [%31, %202 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %405 = "neura.fused_op"(%187, %30, %200) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %406 = "neura.data_mov"(%405) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %406 to [%29, %186 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %407 = "neura.fused_op"(%171, %28, %184) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %408 = "neura.data_mov"(%407) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %408 to [%27, %170 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %409 = "neura.fused_op"(%155, %26, %168) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %410 = "neura.data_mov"(%409) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %410 to [%25, %154 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %411 = "neura.fused_op"(%139, %24, %152) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %412 = "neura.data_mov"(%411) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %412 to [%23, %138 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_4, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_read_out_2 : memref<64x64xi32>) dependency_write_in(%dependency_write_out_3 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %24 = "neura.add"(%23) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%25) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.add"(%25) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25, %27, %33 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%7, %12, %14) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg11, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%16, %13, %6, %11) <{frequency = 108 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %23 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg13, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%5, %10, %18) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%27, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%4, %9, %20) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.div"(%26) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%8, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_6, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%arg2 : memref<64x64xi32>) dependency_write_in(%arg5 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %413 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : !neura.data<index, i1>
          %414 = "neura.add"(%413) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %416 = neura.load_indexed [%415, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%415) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %419 = neura.load_indexed [%418, %414 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %420 = "neura.add"(%415) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %421 = neura.load_indexed [%420, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %422 = "neura.mul"(%421) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %423 = "neura.add"(%419, %422) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%413, %415, %417, %423 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %13 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %113 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %118 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %119 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %120 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %121 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %125 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %130 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %132 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.fused_op"(%22, %132, %134) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137:2 = "neura.fused_op"(%21, %131) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %138 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.fused_op"(%143, %130) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.fused_op"(%142, %129, %146) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.fused_op"(%144, %148, %141, %128) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.fused_op"(%140, %127, %150) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153:2 = "neura.fused_op"(%20, %126) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %154 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.fused_op"(%159, %125) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.fused_op"(%158, %124, %162) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.fused_op"(%160, %164, %157, %123) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.fused_op"(%156, %122, %166) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169:2 = "neura.fused_op"(%19, %121) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %170 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %176 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.fused_op"(%175, %120) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.fused_op"(%174, %119, %178) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.fused_op"(%176, %180, %173, %118) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%181) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%172, %117, %182) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185:2 = "neura.fused_op"(%18, %116) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %186 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %187 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %188 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %189 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%185#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = "neura.data_mov"(%185#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %193 = "neura.fused_op"(%191, %115) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %195 = "neura.fused_op"(%190, %114, %194) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %197 = "neura.fused_op"(%192, %196, %189, %113) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.fused_op"(%188, %112, %198) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201:2 = "neura.fused_op"(%17, %111) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %202 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %203 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %204 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %205 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %206 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.data_mov"(%201#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%201#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.fused_op"(%207, %110) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %210 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %211 = "neura.fused_op"(%206, %109, %210) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %212 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %213 = "neura.fused_op"(%208, %212, %205, %108) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %214 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %215 = "neura.fused_op"(%204, %107, %214) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%215) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217:2 = "neura.fused_op"(%16, %106) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %218 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %219 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %221 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %222 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %223 = "neura.data_mov"(%217#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.data_mov"(%217#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %225 = "neura.fused_op"(%223, %105) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%225) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %227 = "neura.fused_op"(%222, %104, %226) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %228 = "neura.data_mov"(%227) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %229 = "neura.fused_op"(%224, %228, %221, %103) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %230 = "neura.data_mov"(%229) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %231 = "neura.fused_op"(%220, %102, %230) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %232 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233:2 = "neura.fused_op"(%15, %101) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %234 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %235 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %236 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %237 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %238 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %239 = "neura.data_mov"(%233#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %240 = "neura.data_mov"(%233#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %241 = "neura.fused_op"(%239, %100) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %242 = "neura.data_mov"(%241) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %243 = "neura.fused_op"(%238, %99, %242) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %244 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.fused_op"(%240, %244, %237, %98) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %246 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.fused_op"(%236, %97, %246) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%247) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249:2 = "neura.fused_op"(%14, %96) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %250 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %251 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %252 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %253 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %254 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %255 = "neura.data_mov"(%249#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %256 = "neura.data_mov"(%249#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %257 = "neura.fused_op"(%255, %95) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %258 = "neura.data_mov"(%257) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %259 = "neura.fused_op"(%254, %94, %258) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %260 = "neura.data_mov"(%259) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %261 = "neura.fused_op"(%256, %260, %253, %93) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %262 = "neura.data_mov"(%261) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %263 = "neura.fused_op"(%252, %92, %262) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %264 = "neura.data_mov"(%263) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %265:2 = "neura.fused_op"(%13, %91) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %266 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %267 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %268 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %269 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %270 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %271 = "neura.data_mov"(%265#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %272 = "neura.data_mov"(%265#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.fused_op"(%271, %90) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %274 = "neura.data_mov"(%273) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %275 = "neura.fused_op"(%270, %89, %274) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %276 = "neura.data_mov"(%275) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %277 = "neura.fused_op"(%272, %276, %269, %88) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %278 = "neura.data_mov"(%277) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %279 = "neura.fused_op"(%268, %87, %278) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %280 = "neura.data_mov"(%279) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %281:2 = "neura.fused_op"(%12, %86) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %282 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %283 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %284 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %285 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %286 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %287 = "neura.data_mov"(%281#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %288 = "neura.data_mov"(%281#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %289 = "neura.fused_op"(%287, %85) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %290 = "neura.data_mov"(%289) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %291 = "neura.fused_op"(%286, %84, %290) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %292 = "neura.data_mov"(%291) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %293 = "neura.fused_op"(%288, %292, %285, %83) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %294 = "neura.data_mov"(%293) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %295 = "neura.fused_op"(%284, %82, %294) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %296 = "neura.data_mov"(%295) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %297:2 = "neura.fused_op"(%11, %81) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %298 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %299 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %300 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %301 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %302 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %303 = "neura.data_mov"(%297#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %304 = "neura.data_mov"(%297#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %305 = "neura.fused_op"(%303, %80) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %306 = "neura.data_mov"(%305) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %307 = "neura.fused_op"(%302, %79, %306) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %308 = "neura.data_mov"(%307) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %309 = "neura.fused_op"(%304, %308, %301, %78) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %310 = "neura.data_mov"(%309) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %311 = "neura.fused_op"(%300, %77, %310) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %312 = "neura.data_mov"(%311) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %313:2 = "neura.fused_op"(%10, %76) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %314 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %315 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %316 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %317 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %318 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %319 = "neura.data_mov"(%313#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %320 = "neura.data_mov"(%313#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %321 = "neura.fused_op"(%319, %75) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %322 = "neura.data_mov"(%321) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %323 = "neura.fused_op"(%318, %74, %322) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %324 = "neura.data_mov"(%323) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %325 = "neura.fused_op"(%320, %324, %317, %73) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %326 = "neura.data_mov"(%325) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %327 = "neura.fused_op"(%316, %72, %326) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %328 = "neura.data_mov"(%327) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %329:2 = "neura.fused_op"(%9, %71) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %330 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %331 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %332 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %333 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %334 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %335 = "neura.data_mov"(%329#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %336 = "neura.data_mov"(%329#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %337 = "neura.fused_op"(%335, %70) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %338 = "neura.data_mov"(%337) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %339 = "neura.fused_op"(%334, %69, %338) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %340 = "neura.data_mov"(%339) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %341 = "neura.fused_op"(%336, %340, %333, %68) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %342 = "neura.data_mov"(%341) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %343 = "neura.fused_op"(%332, %67, %342) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %344 = "neura.data_mov"(%343) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %345:2 = "neura.fused_op"(%8, %66) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %346 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %347 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %348 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %349 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %350 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %351 = "neura.data_mov"(%345#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %352 = "neura.data_mov"(%345#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %353 = "neura.fused_op"(%351, %65) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %354 = "neura.data_mov"(%353) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %355 = "neura.fused_op"(%350, %64, %354) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %356 = "neura.data_mov"(%355) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %357 = "neura.fused_op"(%352, %356, %349, %63) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %358 = "neura.data_mov"(%357) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %359 = "neura.fused_op"(%348, %62, %358) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %360 = "neura.data_mov"(%359) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %361:2 = "neura.fused_op"(%7, %61) <{frequency = 1222 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = neura.load_indexed [%arg11, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%413, %414 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %362 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %363 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %364 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %365 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %366 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %367 = "neura.data_mov"(%361#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %368 = "neura.data_mov"(%361#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %369 = "neura.fused_op"(%367, %60) <{frequency = 45 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %417 = neura.load_indexed [%416, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %418 = "neura.mul"(%417) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %419 = "neura.add"(%415, %418) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%419 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %370 = "neura.data_mov"(%369) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %371 = "neura.fused_op"(%366, %59, %370) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%arg11, %417 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %372 = "neura.data_mov"(%371) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %373 = "neura.fused_op"(%368, %372, %365, %58) <{frequency = 45 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg11, %413) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %415 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %416 = neura.load_indexed [%arg13, %415 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %417 = "neura.mul"(%416) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %418 = "neura.add"(%414, %417) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%418 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %374 = "neura.data_mov"(%373) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %375 = "neura.fused_op"(%364, %57, %374) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %376 = "neura.data_mov"(%375) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %377 = "neura.fused_op"(%136, %133, %6, %56) <{frequency = 108 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %413 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %414 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%arg13, %414 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.mul"(%415) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%413, %416) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %378 = "neura.data_mov"(%377) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %379 = "neura.fused_op"(%5, %55, %378) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %418 = neura.load_indexed [%417, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %419 = "neura.mul"(%418) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %420 = "neura.add"(%416, %419) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%420 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %380 = "neura.data_mov"(%379) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %381 = "neura.fused_op"(%4, %54, %380) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %382 = "neura.data_mov"(%381) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %382 to [%53, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %383 = "neura.fused_op"(%363, %52, %376) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %384 = "neura.data_mov"(%383) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %384 to [%51, %362 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %385 = "neura.fused_op"(%347, %50, %360) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %386 = "neura.data_mov"(%385) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %386 to [%49, %346 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %387 = "neura.fused_op"(%331, %48, %344) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %388 = "neura.data_mov"(%387) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %388 to [%47, %330 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %389 = "neura.fused_op"(%315, %46, %328) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %390 = "neura.data_mov"(%389) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %390 to [%45, %314 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %391 = "neura.fused_op"(%299, %44, %312) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %392 = "neura.data_mov"(%391) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %392 to [%43, %298 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %393 = "neura.fused_op"(%283, %42, %296) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %394 = "neura.data_mov"(%393) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %394 to [%41, %282 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %395 = "neura.fused_op"(%267, %40, %280) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %396 = "neura.data_mov"(%395) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %396 to [%39, %266 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %397 = "neura.fused_op"(%251, %38, %264) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %398 = "neura.data_mov"(%397) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %398 to [%37, %250 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %399 = "neura.fused_op"(%235, %36, %248) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %400 = "neura.data_mov"(%399) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %400 to [%35, %234 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %401 = "neura.fused_op"(%219, %34, %232) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %402 = "neura.data_mov"(%401) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %402 to [%33, %218 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %403 = "neura.fused_op"(%203, %32, %216) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %404 = "neura.data_mov"(%403) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %404 to [%31, %202 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %405 = "neura.fused_op"(%187, %30, %200) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %406 = "neura.data_mov"(%405) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %406 to [%29, %186 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %407 = "neura.fused_op"(%171, %28, %184) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %408 = "neura.data_mov"(%407) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %408 to [%27, %170 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %409 = "neura.fused_op"(%155, %26, %168) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %410 = "neura.data_mov"(%409) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %410 to [%25, %154 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %411 = "neura.fused_op"(%139, %24, %152) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %413 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %414 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %415 = neura.load_indexed [%414, %413 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %416 = "neura.add"(%arg12, %415) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %417 = "neura.div"(%416) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%417 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %412 = "neura.data_mov"(%411) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %412 to [%23, %138 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_8, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%dependency_read_out_6 : memref<64x64xi32>) dependency_write_in(%dependency_write_out_7 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %24 = "neura.add"(%23) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %26 = neura.load_indexed [%25, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.mul"(%26) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %28 = "neura.add"(%25) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %29 = neura.load_indexed [%28, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %30 = "neura.add"(%25) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %31 = neura.load_indexed [%30, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %32 = "neura.mul"(%31) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%23, %25, %27, %33 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%7, %12, %14) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%arg11, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%16, %13, %6, %11) <{frequency = 108 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %23 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg13, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%5, %10, %18) <{frequency = 102 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %28 = neura.load_indexed [%27, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %29 = "neura.mul"(%28) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %30 = "neura.add"(%26, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%30 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%4, %9, %20) <{frequency = 51 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %23 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %24 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.add"(%arg12, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.div"(%26) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%8, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "counter->fused_op:counter->load_indexed"}> ({
          %160 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 16 : index, upper_bound = 50 : index} : !neura.data<index, i1>
          %161 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %162 = neura.load_indexed [%161, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%160, %161, %162 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %17 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %30 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%51, %19, %52) <{frequency = 4 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:fused_op:load_indexed->mul->fused_op:fused_op:load_indexed->mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %160 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %163 = "neura.mul"(%162, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %164 = "neura.sub"(%163, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.add"(%162, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.mul"(%165, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.mul"(%166) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.sub"(%164, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55:4 = "neura.fused_op"(%18, %50) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %56 = "neura.data_mov"(%55#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%55#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%55#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%55#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60:4 = "neura.fused_op"(%17, %49) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %61 = "neura.data_mov"(%60#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%60#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%60#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%60#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65:4 = "neura.fused_op"(%16, %48) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %66 = "neura.data_mov"(%65#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%65#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%65#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%65#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70:4 = "neura.fused_op"(%15, %47) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %71 = "neura.data_mov"(%70#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%70#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%70#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%70#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75:4 = "neura.fused_op"(%14, %46) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %76 = "neura.data_mov"(%75#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%75#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%75#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80:4 = "neura.fused_op"(%13, %45) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %81 = "neura.data_mov"(%80#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%80#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85:4 = "neura.fused_op"(%12, %44) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %86 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%85#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%85#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%85#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90:4 = "neura.fused_op"(%11, %43) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %91 = "neura.data_mov"(%90#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%90#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%90#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95:4 = "neura.fused_op"(%10, %42) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %96 = "neura.data_mov"(%95#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%95#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%95#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100:4 = "neura.fused_op"(%9, %41) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %101 = "neura.data_mov"(%100#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%100#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%100#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%100#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105:4 = "neura.fused_op"(%8, %40) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %106 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%105#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.data_mov"(%105#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%105#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110:4 = "neura.fused_op"(%7, %39) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %111 = "neura.data_mov"(%110#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%110#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%110#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%110#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115:4 = "neura.fused_op"(%6, %38) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %116 = "neura.data_mov"(%115#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = "neura.data_mov"(%115#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%115#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%115#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120:4 = "neura.fused_op"(%5, %37) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %121 = "neura.data_mov"(%120#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.data_mov"(%120#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.data_mov"(%120#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.data_mov"(%120#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125:4 = "neura.fused_op"(%4, %36) <{frequency = 45 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %160 = "neura.add"(%arg14) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %163 = neura.load_indexed [%arg15, %160 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %164 = "neura.mul"(%163, %163) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %165 = "neura.mul"(%161, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%165, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%160, %161, %162, %166 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %126 = "neura.data_mov"(%125#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%125#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%125#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.data_mov"(%125#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %54 to [%35, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %130 = "neura.fused_op"(%57, %58, %59) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %131 to [%34, %56 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %132 = "neura.fused_op"(%62, %63, %64) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %133 to [%33, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %134 = "neura.fused_op"(%67, %68, %69) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %135 to [%32, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %136 = "neura.fused_op"(%72, %73, %74) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %137 to [%31, %71 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %138 = "neura.fused_op"(%77, %78, %79) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %139 to [%30, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %140 = "neura.fused_op"(%82, %83, %84) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %141 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %141 to [%29, %81 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %142 = "neura.fused_op"(%87, %88, %89) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %143 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %143 to [%28, %86 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %144 = "neura.fused_op"(%92, %93, %94) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%144) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %145 to [%27, %91 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %146 = "neura.fused_op"(%97, %98, %99) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %147 to [%26, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %148 = "neura.fused_op"(%102, %103, %104) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %149 to [%25, %101 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %150 = "neura.fused_op"(%107, %108, %109) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%150) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %151 to [%24, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %152 = "neura.fused_op"(%112, %113, %114) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %153 to [%23, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %154 = "neura.fused_op"(%117, %118, %119) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %155 = "neura.data_mov"(%154) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %155 to [%22, %116 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %156 = "neura.fused_op"(%122, %123, %124) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %157 = "neura.data_mov"(%156) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %157 to [%21, %121 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %158 = "neura.fused_op"(%127, %128, %129) <{frequency = 17 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %160 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %161 = "neura.mul"(%160, %160) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.mul"(%161) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.sub"(%arg16, %162) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%163 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %159 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %159 to [%20, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg4, %arg5, %arg6 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out#0, %dependency_read_out#1, %dependency_read_out#2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) value_inputs(%c4_i32 : i32) [original_read_memrefs(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "counter->fused_op:counter->load_indexed"}> ({
          %10 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 50 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%10, %11, %12 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.fused_op"(%4, %6, %7) <{frequency = 4 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:fused_op:load_indexed->mul->fused_op:fused_op:load_indexed->mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %10 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = "neura.mul"(%12, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.sub"(%13, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %15 = "neura.add"(%12, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.mul"(%15, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %17 = "neura.mul"(%16) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %18 = "neura.sub"(%14, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%18 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg4, %arg5, %arg6 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    return {latency = 1 : i32}
  }
}

