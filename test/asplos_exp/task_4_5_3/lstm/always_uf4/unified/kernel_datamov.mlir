module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:9, %dependency_write_out:4 = taskflow.task @fused_sibling dependency_read_in(%arg10, %arg0, %arg2, %arg11, %arg3, %arg12, %arg4, %arg13, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2, %arg11, %arg0, %arg3, %arg12, %arg0, %arg4, %arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %83 = "neura.add"(%82) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %84 = "neura.add"(%82) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %85 = "neura.add"(%82) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%82, %83, %84, %85 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
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
        %16 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:2 = "neura.fused_op"(%15) <{frequency = 32 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%82, %87 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%14, %50) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%13, %49) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%12, %48) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%11, %47) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%10, %46) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%9, %45) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%8, %44) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%7, %43) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%6, %42) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%41, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%40, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%39, %17) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_0:9, %dependency_write_out_1:4 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out#0, %arg1, %arg6, %dependency_write_out#1, %arg7, %dependency_write_out#2, %arg8, %dependency_write_out#3, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out#0, %dependency_write_out#1, %dependency_write_out#2, %dependency_write_out#3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6, %arg11, %arg1, %arg7, %arg12, %arg1, %arg8, %arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %83 = "neura.add"(%82) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %84 = "neura.add"(%82) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %85 = "neura.add"(%82) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%82, %83, %84, %85 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
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
        %16 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19:2 = "neura.fused_op"(%15) <{frequency = 32 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%82, %87 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %20 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%19#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%14, %50) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%13, %49) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%12, %48) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%11, %47) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%10, %46) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%9, %45) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%8, %44) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%7, %43) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%6, %42) <{frequency = 18 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = "neura.add"(%arg39) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg40, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%41, %5) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%40, %4) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%39, %17) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 32 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg39: !neura.data<index, i1>, %arg40: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg39, %arg40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input3"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_2:5, %dependency_write_out_3 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_1#1, %arg14, %dependency_write_out_1#0, %dependency_write_out_1#3, %dependency_write_out_1#2 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 28 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %32 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %33 = "neura.add"(%32) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%32, %33 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.fused_op"(%8) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%7) <{frequency = 34 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %32 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %33 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%34 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13:4 = "neura.fused_op"(%12, %10) <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:add->mul->mul->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %34 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = "neura.mul"(%32, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32, %33, %34, %35 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %14 = "neura.data_mov"(%13#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%13#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%13#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%13#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.fused_op"(%6, %16) <{frequency = 72 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %32 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %33 = "neura.mul"(%32, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%33 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %21:2 = "neura.fused_op"(%4, %17) <{frequency = 25 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %22 = "neura.data_mov"(%21#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%21#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %23 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%3, %18) <{frequency = 25 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg30) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %27 = "neura.mul"(%15, %14) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%27) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29:2 = "neura.fused_op"(%2, %28) <{frequency = 25 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %32 = "neura.add"(%arg30) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%32, %34 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %30 = "neura.data_mov"(%29#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%29#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

