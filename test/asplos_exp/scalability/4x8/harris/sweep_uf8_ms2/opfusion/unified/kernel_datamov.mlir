module {
  func.func @sobel_x(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %158 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%158) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = "neura.add"(%160) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%158, %159, %160, %161 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
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
        %14 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21:3 = "neura.fused_op"(%14, %13) <{frequency = 48 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = neura.load_indexed [%162, %161 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %160, %163 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%21#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64:3 = "neura.fused_op"(%12, %61) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %65 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%64#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%64#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71:3 = "neura.fused_op"(%11, %60) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %72 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%71#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%71#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78:3 = "neura.fused_op"(%10, %59) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %79 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%78#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%78#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85:3 = "neura.fused_op"(%9, %58) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %86 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%85#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%85#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92:3 = "neura.fused_op"(%8, %57) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %93 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%92#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%92#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99:3 = "neura.fused_op"(%7, %56) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %100 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%99#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%99#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.fused_op"(%6, %55) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%5, %54) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.fused_op"(%109, %62, %53, %4, %63, %107) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%19, %52) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.fused_op"(%18, %51) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%17, %50) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.fused_op"(%103, %49) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%102, %48) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.fused_op"(%121, %104, %47, %101, %105, %119) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%96, %46) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.fused_op"(%95, %45) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.fused_op"(%127, %97, %44, %94, %98, %125) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.data_mov"(%128) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %130 = "neura.fused_op"(%89, %43) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.fused_op"(%88, %42) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.fused_op"(%133, %90, %41, %87, %91, %131) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.fused_op"(%82, %40) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %138 = "neura.fused_op"(%81, %39) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140 = "neura.fused_op"(%139, %83, %38, %80, %84, %137) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %141 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %142 = "neura.fused_op"(%75, %37) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %143 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %144 = "neura.fused_op"(%74, %36) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%144) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %146 = "neura.fused_op"(%145, %76, %35, %73, %77, %143) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.fused_op"(%68, %34) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %149 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.fused_op"(%67, %33) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%150) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.fused_op"(%151, %69, %32, %66, %70, %149) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %111 to [%31, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %153 to [%30, %65 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %147 to [%29, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %141 to [%28, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %135 to [%27, %86 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %129 to [%26, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %123 to [%25, %100 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %154 = "neura.fused_op"(%24, %20) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = neura.load_indexed [%158, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%159 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %155 = "neura.data_mov"(%154) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %156 = "neura.fused_op"(%117, %155, %23, %16, %113, %115) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %arg9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %157 = "neura.data_mov"(%156) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %157 to [%22, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:3 = "neura.fused_op"(%3) <{frequency = 2 : i64, pattern_id = 41 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:add->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %21 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
        %12 = "neura.fused_op"(%8, %11) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%7, %14) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.fused_op"(%16, %10, %17, %6, %9, %13) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 19 : i64, pattern_name = "fused_op:counter->add->fused_op:add->add"}> ({
          %158 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%158) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = "neura.add"(%160) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%158, %159, %160, %161 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
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
        %14 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21:3 = "neura.fused_op"(%14, %13) <{frequency = 48 : i64, pattern_id = 16 : i64, pattern_name = "fused_op:counter->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %arg6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = neura.load_indexed [%162, %161 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %160, %163 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%21#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64:3 = "neura.fused_op"(%12, %61) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %65 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%64#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%64#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%64#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71:3 = "neura.fused_op"(%11, %60) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %72 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%71#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%71#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%71#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78:3 = "neura.fused_op"(%10, %59) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %79 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%78#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%78#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85:3 = "neura.fused_op"(%9, %58) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %86 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%85#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%85#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%85#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92:3 = "neura.fused_op"(%8, %57) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %93 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%92#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%92#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%92#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99:3 = "neura.fused_op"(%7, %56) <{frequency = 36 : i64, pattern_id = 27 : i64, pattern_name = "fused_op:fused_op:add->add->fused_op:add->load_indexed->fused_op:add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%158) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %161 = neura.load_indexed [%160, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %162 = "neura.add"(%158) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %163 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%163, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%158, %161, %164 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %100 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = "neura.data_mov"(%99#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = "neura.data_mov"(%99#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%99#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.fused_op"(%6, %55) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%5, %54) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.fused_op"(%107, %62, %4, %53, %63, %109) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%19, %52) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.fused_op"(%18, %51) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%17, %50) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.fused_op"(%103, %49) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%102, %48) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.fused_op"(%119, %104, %101, %47, %105, %121) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%96, %46) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.fused_op"(%95, %45) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.fused_op"(%125, %97, %94, %44, %98, %127) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.data_mov"(%128) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %130 = "neura.fused_op"(%89, %43) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.fused_op"(%88, %42) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.fused_op"(%131, %90, %87, %41, %91, %133) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.fused_op"(%82, %40) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %138 = "neura.fused_op"(%81, %39) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140 = "neura.fused_op"(%137, %83, %80, %38, %84, %139) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %141 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %142 = "neura.fused_op"(%75, %37) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %143 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %144 = "neura.fused_op"(%74, %36) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%144) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %146 = "neura.fused_op"(%143, %76, %73, %35, %77, %145) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.fused_op"(%68, %34) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %149 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.fused_op"(%67, %33) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%159, %158 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%160 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%150) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.fused_op"(%149, %69, %66, %32, %70, %151) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %111 to [%31, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %153 to [%30, %65 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %147 to [%29, %72 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %141 to [%28, %79 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %135 to [%27, %86 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %129 to [%26, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %123 to [%25, %100 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %154 = "neura.fused_op"(%24, %20) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %158 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %159 = neura.load_indexed [%158, %arg7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%159 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %155 = "neura.data_mov"(%154) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %156 = "neura.fused_op"(%115, %155, %16, %23, %113, %117) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<index, i1>, %arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>):
          %158 = "neura.sub"(%arg6, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %159 = "neura.add"(%arg8) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %160 = neura.load_indexed [%arg9, %159 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %161 = "neura.mul"(%160) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %162 = "neura.add"(%158, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %163 = "neura.add"(%arg8) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %164 = neura.load_indexed [%arg9, %163 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %165 = "neura.mul"(%164) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %166 = "neura.sub"(%162, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %167 = "neura.sub"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %168 = "neura.add"(%166, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%168 : !neura.data<i32, i1>)
        }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %157 = "neura.data_mov"(%156) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %157 to [%22, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4:3 = "neura.fused_op"(%3) <{frequency = 2 : i64, pattern_id = 41 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:add->fused_op:add->load_indexed->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %21 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
        %12 = "neura.fused_op"(%8, %11) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.fused_op"(%7, %14) <{frequency = 156 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:add->load_indexed"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %21 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = "neura.add"(%arg7) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %23 = neura.load_indexed [%22, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%23 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.fused_op"(%13, %10, %6, %17, %9, %16) <{frequency = 18 : i64, pattern_id = 54 : i64, pattern_name = "fused_op:sub->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:fused_op:add->load_indexed->fused_op:mul->sub->fused_op:sub->add"}> ({
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:5 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:counter->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
          %45 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : !neura.data<index, i1>
          %46 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %47 = neura.load_indexed [%46, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %48 = "neura.mul"(%47, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %49 = "neura.add"(%45) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%46, %49 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%50, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %46, %48, %49, %51 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %24 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9, %23) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%8, %22) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%7, %21) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%6, %20) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%5, %19) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42:2 = "neura.fused_op"(%4, %18) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %43 = "neura.data_mov"(%42#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%42#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%17, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %44 to [%16, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %41 to [%15, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %38 to [%14, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%13, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %32 to [%12, %31 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%11, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %26 to [%10, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:5 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 21 : i64, pattern_name = "fused_op:counter->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->mul"}> ({
          %45 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : !neura.data<index, i1>
          %46 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %47 = neura.load_indexed [%46, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %48 = "neura.mul"(%47, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %49 = "neura.add"(%45) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %50 = neura.load_indexed [%46, %49 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%50, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %46, %48, %49, %51 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %24 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%9, %23) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%8, %22) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%7, %21) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%6, %20) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%5, %19) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42:2 = "neura.fused_op"(%4, %18) <{frequency = 35 : i64, pattern_id = 15 : i64, pattern_name = "fused_op:add->load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>, %arg7: !neura.data<index, i1>):
          %45 = "neura.add"(%arg6) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %46 = neura.load_indexed [%arg7, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%45, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %43 = "neura.data_mov"(%42#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%42#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%17, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %44 to [%16, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %41 to [%15, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %38 to [%14, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%13, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %32 to [%12, %31 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%11, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.store_indexed %26 to [%10, %25 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "counter->fused_op:counter->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:counter->fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
          %48 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 8 : index, upper_bound = 57 : index} : !neura.data<index, i1>
          %49 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %50 = neura.load_indexed [%49, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = neura.load_indexed [%49, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %52 = "neura.mul"(%51, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %49, %52 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %26 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27:2 = "neura.fused_op"(%10, %25) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %28 = "neura.data_mov"(%27#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%27#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%9, %24) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33:2 = "neura.fused_op"(%8, %23) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%7, %22) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39:2 = "neura.fused_op"(%6, %21) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %40 = "neura.data_mov"(%39#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%39#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42:2 = "neura.fused_op"(%5, %20) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %43 = "neura.data_mov"(%42#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%42#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%4, %19) <{frequency = 14 : i64, pattern_id = 34 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<index, i1>):
          %48 = "neura.add"(%arg9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %49 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %50 = neura.load_indexed [%arg10, %48 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %51 = "neura.mul"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%48, %51 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%18, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %47 to [%17, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %44 to [%16, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %41 to [%15, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %38 to [%14, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%13, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %32 to [%12, %31 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%11, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg5 : memref<64x64xi32>)
    }
    %dependency_read_out_0:2, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out#0, %dependency_read_out#1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0, %arg1 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 26 : i64, pattern_name = "fused_op:counter->fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
          %6 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
          %7 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 57 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %205 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : !neura.data<index, i1>
          %206 = "neura.add"(%205) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %208 = neura.load_indexed [%207, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%207) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %211 = neura.load_indexed [%210, %206 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %212 = "neura.add"(%207) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %213 = neura.load_indexed [%212, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %214 = "neura.mul"(%213) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %215 = "neura.add"(%211, %214) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%205, %207, %209, %215 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %69 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.fused_op"(%14, %68, %70) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73:2 = "neura.fused_op"(%13, %67) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %74 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%73#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.fused_op"(%79, %66) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.fused_op"(%78, %65, %82) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%80, %84, %77, %64) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%76, %63, %86) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89:2 = "neura.fused_op"(%12, %62) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %90 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%89#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.fused_op"(%95, %61) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.fused_op"(%94, %60, %98) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.fused_op"(%96, %100, %93, %59) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.fused_op"(%92, %58, %102) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105:2 = "neura.fused_op"(%11, %57) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %106 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%105#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.fused_op"(%111, %56) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.fused_op"(%110, %55, %114) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.fused_op"(%112, %116, %109, %54) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.fused_op"(%108, %53, %118) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121:2 = "neura.fused_op"(%10, %52) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %122 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %125 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%121#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.fused_op"(%127, %51) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.fused_op"(%126, %50, %130) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.fused_op"(%128, %132, %125, %49) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%133) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.fused_op"(%124, %48, %134) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137:2 = "neura.fused_op"(%9, %47) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %138 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.fused_op"(%143, %46) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.fused_op"(%142, %45, %146) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.fused_op"(%144, %148, %141, %44) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.fused_op"(%140, %43, %150) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153:2 = "neura.fused_op"(%8, %42) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %154 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.fused_op"(%159, %41) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.fused_op"(%158, %40, %162) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.fused_op"(%160, %164, %157, %39) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.fused_op"(%156, %38, %166) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169:2 = "neura.fused_op"(%7, %37) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %170 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %176 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.fused_op"(%175, %36) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.fused_op"(%174, %35, %178) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.fused_op"(%176, %180, %173, %34) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%181) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%172, %33, %182) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.fused_op"(%72, %69, %6, %32) <{frequency = 60 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%arg13, %206 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.mul"(%207) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%205, %208) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %186 = "neura.data_mov"(%185) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.fused_op"(%5, %31, %186) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.fused_op"(%4, %30, %188) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.data_mov"(%189) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %190 to [%29, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %191 = "neura.fused_op"(%171, %28, %184) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%191) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %192 to [%27, %170 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %193 = "neura.fused_op"(%155, %26, %168) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %194 to [%25, %154 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.fused_op"(%139, %24, %152) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %196 to [%23, %138 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %197 = "neura.fused_op"(%123, %22, %136) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %198 to [%21, %122 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %199 = "neura.fused_op"(%107, %20, %120) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %200 to [%19, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %201 = "neura.fused_op"(%91, %18, %104) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %202 to [%17, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %203 = "neura.fused_op"(%75, %16, %88) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %204 to [%15, %74 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
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
        %15 = "neura.fused_op"(%7, %12, %14) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
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
        %17 = "neura.fused_op"(%16, %13, %6, %11) <{frequency = 60 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %23 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg13, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%5, %10, %18) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
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
        %21 = "neura.fused_op"(%4, %9, %20) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %205 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : !neura.data<index, i1>
          %206 = "neura.add"(%205) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %208 = neura.load_indexed [%207, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%207) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %211 = neura.load_indexed [%210, %206 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %212 = "neura.add"(%207) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %213 = neura.load_indexed [%212, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %214 = "neura.mul"(%213) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %215 = "neura.add"(%211, %214) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%205, %207, %209, %215 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %69 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.fused_op"(%14, %68, %70) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73:2 = "neura.fused_op"(%13, %67) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %74 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%73#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.fused_op"(%79, %66) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.fused_op"(%78, %65, %82) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%80, %84, %77, %64) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%76, %63, %86) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89:2 = "neura.fused_op"(%12, %62) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %90 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%89#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.fused_op"(%95, %61) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.fused_op"(%94, %60, %98) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.fused_op"(%96, %100, %93, %59) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.fused_op"(%92, %58, %102) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105:2 = "neura.fused_op"(%11, %57) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %106 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%105#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.fused_op"(%111, %56) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.fused_op"(%110, %55, %114) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.fused_op"(%112, %116, %109, %54) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.fused_op"(%108, %53, %118) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121:2 = "neura.fused_op"(%10, %52) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %122 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %125 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%121#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.fused_op"(%127, %51) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.fused_op"(%126, %50, %130) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.fused_op"(%128, %132, %125, %49) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%133) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.fused_op"(%124, %48, %134) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137:2 = "neura.fused_op"(%9, %47) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %138 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.fused_op"(%143, %46) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.fused_op"(%142, %45, %146) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.fused_op"(%144, %148, %141, %44) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.fused_op"(%140, %43, %150) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153:2 = "neura.fused_op"(%8, %42) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %154 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.fused_op"(%159, %41) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.fused_op"(%158, %40, %162) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.fused_op"(%160, %164, %157, %39) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.fused_op"(%156, %38, %166) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169:2 = "neura.fused_op"(%7, %37) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %170 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %176 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.fused_op"(%175, %36) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.fused_op"(%174, %35, %178) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.fused_op"(%176, %180, %173, %34) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%181) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%172, %33, %182) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.fused_op"(%72, %69, %6, %32) <{frequency = 60 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%arg13, %206 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.mul"(%207) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%205, %208) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %186 = "neura.data_mov"(%185) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.fused_op"(%5, %31, %186) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.fused_op"(%4, %30, %188) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.data_mov"(%189) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %190 to [%29, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %191 = "neura.fused_op"(%171, %28, %184) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%191) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %192 to [%27, %170 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %193 = "neura.fused_op"(%155, %26, %168) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %194 to [%25, %154 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.fused_op"(%139, %24, %152) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %196 to [%23, %138 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %197 = "neura.fused_op"(%123, %22, %136) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %198 to [%21, %122 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %199 = "neura.fused_op"(%107, %20, %120) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %200 to [%19, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %201 = "neura.fused_op"(%91, %18, %104) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %202 to [%17, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %203 = "neura.fused_op"(%75, %16, %88) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %204 to [%15, %74 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_4, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_read_out_2 : memref<64x64xi32>) dependency_write_in(%dependency_write_out_3 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
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
        %15 = "neura.fused_op"(%7, %12, %14) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
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
        %17 = "neura.fused_op"(%16, %13, %6, %11) <{frequency = 60 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %23 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg13, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%5, %10, %18) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
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
        %21 = "neura.fused_op"(%4, %9, %20) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %205 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : !neura.data<index, i1>
          %206 = "neura.add"(%205) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %208 = neura.load_indexed [%207, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%207) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %211 = neura.load_indexed [%210, %206 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %212 = "neura.add"(%207) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %213 = neura.load_indexed [%212, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %214 = "neura.mul"(%213) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %215 = "neura.add"(%211, %214) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%205, %207, %209, %215 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
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
        %69 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.fused_op"(%14, %68, %70) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73:2 = "neura.fused_op"(%13, %67) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %74 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%73#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%73#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.fused_op"(%79, %66) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.fused_op"(%78, %65, %82) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%80, %84, %77, %64) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%76, %63, %86) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89:2 = "neura.fused_op"(%12, %62) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %90 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = "neura.data_mov"(%89#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.data_mov"(%89#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.fused_op"(%95, %61) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.fused_op"(%94, %60, %98) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.fused_op"(%96, %100, %93, %59) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.fused_op"(%92, %58, %102) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105:2 = "neura.fused_op"(%11, %57) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %106 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%105#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.fused_op"(%111, %56) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.fused_op"(%110, %55, %114) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.fused_op"(%112, %116, %109, %54) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %118 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.fused_op"(%108, %53, %118) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%119) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121:2 = "neura.fused_op"(%10, %52) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %122 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %125 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.data_mov"(%121#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%121#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.fused_op"(%127, %51) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.fused_op"(%126, %50, %130) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.fused_op"(%128, %132, %125, %49) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%133) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.fused_op"(%124, %48, %134) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137:2 = "neura.fused_op"(%9, %47) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %138 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = "neura.data_mov"(%137#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.fused_op"(%143, %46) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.fused_op"(%142, %45, %146) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.fused_op"(%144, %148, %141, %44) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.fused_op"(%140, %43, %150) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153:2 = "neura.fused_op"(%8, %42) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %154 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = "neura.data_mov"(%153#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.fused_op"(%159, %41) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %162 = "neura.data_mov"(%161) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.fused_op"(%158, %40, %162) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.fused_op"(%160, %164, %157, %39) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.fused_op"(%156, %38, %166) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169:2 = "neura.fused_op"(%7, %37) <{frequency = 630 : i64, pattern_id = 2 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = neura.load_indexed [%arg11, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%205, %206 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %170 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %172 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = "neura.data_mov"(%169#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %176 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.fused_op"(%175, %36) <{frequency = 21 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %209 = neura.load_indexed [%208, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %210 = "neura.mul"(%209) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %211 = "neura.add"(%207, %210) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%211 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.fused_op"(%174, %35, %178) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%arg11, %209 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.fused_op"(%176, %180, %173, %34) <{frequency = 21 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.mul"(%arg10) {rhs_value = 4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg11, %205) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %207 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %208 = neura.load_indexed [%arg13, %207 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %209 = "neura.mul"(%208) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %210 = "neura.add"(%206, %209) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%210 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%181) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.fused_op"(%172, %33, %182) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.fused_op"(%72, %69, %6, %32) <{frequency = 60 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %205 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %206 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%arg13, %206 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.mul"(%207) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%205, %208) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %186 = "neura.data_mov"(%185) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.fused_op"(%5, %31, %186) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %210 = neura.load_indexed [%209, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %211 = "neura.mul"(%210) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %212 = "neura.add"(%208, %211) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%212 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.fused_op"(%4, %30, %188) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.data_mov"(%189) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %190 to [%29, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %191 = "neura.fused_op"(%171, %28, %184) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%191) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %192 to [%27, %170 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %193 = "neura.fused_op"(%155, %26, %168) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %194 to [%25, %154 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.fused_op"(%139, %24, %152) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %196 to [%23, %138 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %197 = "neura.fused_op"(%123, %22, %136) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %198 to [%21, %122 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %199 = "neura.fused_op"(%107, %20, %120) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %200 to [%19, %106 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %201 = "neura.fused_op"(%91, %18, %104) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %202 to [%17, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        %203 = "neura.fused_op"(%75, %16, %88) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<index, i1>, %arg12: !neura.data<i32, i1>):
          %205 = "neura.add"(%arg10) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %206 = "neura.add"(%arg11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %207 = neura.load_indexed [%206, %205 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %208 = "neura.add"(%arg12, %207) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %209 = "neura.div"(%208) {rhs_value = 16 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%209 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %204 to [%15, %74 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6 : memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_8, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%dependency_read_out_6 : memref<64x64xi32>) dependency_write_in(%dependency_write_out_7 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg6, %arg7 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 18 : i64, pattern_id = 48 : i64, pattern_name = "fused_op:fused_op:counter->add->fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %23 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
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
        %15 = "neura.fused_op"(%7, %12, %14) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
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
        %17 = "neura.fused_op"(%16, %13, %6, %11) <{frequency = 60 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<index, i1>, %arg13: !neura.data<index, i1>):
          %23 = "neura.add"(%arg10, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%arg12) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%arg13, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%27 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%5, %10, %18) <{frequency = 54 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
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
        %21 = "neura.fused_op"(%4, %9, %20) <{frequency = 27 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:add->fused_op:add->load_indexed->fused_op:add->div"}> ({
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
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "counter->fused_op:counter->load_indexed"}> ({
          %80 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 8 : index, upper_bound = 58 : index} : !neura.data<index, i1>
          %81 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %82 = neura.load_indexed [%81, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%80, %81, %82 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %12 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %28 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.fused_op"(%27, %11, %28) <{frequency = 4 : i64, pattern_id = 51 : i64, pattern_name = "fused_op:fused_op:load_indexed->mul->fused_op:fused_op:load_indexed->mul->sub->fused_op:fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %80 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg14, %arg15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %83 = "neura.mul"(%82, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %84 = "neura.sub"(%83, %81) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.add"(%82, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.mul"(%85, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %87 = "neura.mul"(%86) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %88 = "neura.sub"(%84, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%88 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31:4 = "neura.fused_op"(%10, %26) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %32 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%31#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%31#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:4 = "neura.fused_op"(%9, %25) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%36#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%36#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41:4 = "neura.fused_op"(%8, %24) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %42 = "neura.data_mov"(%41#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%41#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:4 = "neura.fused_op"(%7, %23) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%46#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%46#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:4 = "neura.fused_op"(%6, %22) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%51#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%51#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56:4 = "neura.fused_op"(%5, %21) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %57 = "neura.data_mov"(%56#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%56#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61:4 = "neura.fused_op"(%4, %20) <{frequency = 21 : i64, pattern_id = 33 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->fused_op:fused_op:load_indexed->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<index, i1>, %arg15: !neura.data<index, i1>):
          %80 = "neura.add"(%arg14) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %81 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %82 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg15, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = "neura.sub"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%80, %81, %82, %86 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %62 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%61#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%61#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%61#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%19, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %66 = "neura.fused_op"(%33, %34, %35) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %67 to [%18, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %68 = "neura.fused_op"(%38, %39, %40) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %69 to [%17, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %70 = "neura.fused_op"(%43, %44, %45) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %71 to [%16, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %72 = "neura.fused_op"(%48, %49, %50) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%15, %47 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %74 = "neura.fused_op"(%53, %54, %55) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %75 to [%14, %52 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %76 = "neura.fused_op"(%58, %59, %60) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%13, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        %78 = "neura.fused_op"(%63, %64, %65) <{frequency = 9 : i64, pattern_id = 17 : i64, pattern_name = "fused_op:add->mul->fused_op:mul->sub"}> ({
        ^bb0(%arg14: !neura.data<i32, i1>, %arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %80 = "neura.add"(%arg14, %arg15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %81 = "neura.mul"(%80, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %82 = "neura.mul"(%81) {lhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %83 = "neura.sub"(%arg16, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%83 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%12, %62 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg4, %arg5, %arg6 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg7 : memref<64x64xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out#0, %dependency_read_out#1, %dependency_read_out#2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) value_inputs(%c4_i32 : i32) [original_read_memrefs(%arg0, %arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] {latency = 1 : i32} : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg4, %arg5, %arg6, %arg8, %arg7 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg9: memref<64x64xi32>, %arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32, %arg13: memref<64x64xi32>):
        %2:3 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "counter->fused_op:counter->load_indexed"}> ({
          %10 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 58 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
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

