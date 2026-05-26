module {
  func.func @lstm_cell(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32x32xi32>, %arg3: memref<32x32xi32>, %arg4: memref<32x32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32x32xi32>, %arg7: memref<32x32xi32>, %arg8: memref<32x32xi32>, %arg9: memref<32x32xi32>, %arg10: memref<32xi32>, %arg11: memref<32xi32>, %arg12: memref<32xi32>, %arg13: memref<32xi32>, %arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg10, %arg0, %arg2 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg10 : memref<32xi32>) [original_read_memrefs(%arg10, %arg0, %arg2 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg11, %dependency_read_out#1, %arg3 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg11 : memref<32xi32>) [original_read_memrefs(%arg11, %arg0, %arg3 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg12, %dependency_read_out#1, %arg4 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg12 : memref<32xi32>) [original_read_memrefs(%arg12, %arg0, %arg4 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg12 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg13, %dependency_read_out#1, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg13 : memref<32xi32>) [original_read_memrefs(%arg13, %arg0, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%dependency_write_out, %arg1, %arg6 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out : memref<32xi32>) [original_read_memrefs(%arg10, %arg1, %arg6 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%dependency_write_out_1, %dependency_read_out_6#1, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out_1 : memref<32xi32>) [original_read_memrefs(%arg11, %arg1, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_10:3, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_3, %dependency_read_out_6#1, %arg8 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out_3 : memref<32xi32>) [original_read_memrefs(%arg12, %arg1, %arg8 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg12 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%dependency_write_out_5, %dependency_read_out_6#1, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out_5 : memref<32xi32>) [original_read_memrefs(%arg13, %arg1, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 104 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %82 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %19:2 = "neura.fused_op"(%17) <{frequency = 128 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %82 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %83 = neura.load_indexed [%82, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
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
        %52 = "neura.fused_op"(%15, %50) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.fused_op"(%14, %49) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.fused_op"(%13, %48) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.fused_op"(%12, %47) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.fused_op"(%11, %46) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%10, %45) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%9, %44) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%8, %43) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%7, %42) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%6, %41) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%5, %40) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%4, %39) <{frequency = 96 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %83 = neura.load_indexed [%arg25, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %84 = neura.load_indexed [%82 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %86 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %87 = "neura.add"(%86, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%87 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%38, %16) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.fused_op"(%37, %3) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %79 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.fused_op"(%33, %18) <{frequency = 128 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %82 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %83 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %84 = "neura.mul"(%83, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %85 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %86 = "neura.add"(%85, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%86 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %75 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %73 to [%30 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%28 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %67 to [%27 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %61 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %55 to [%21 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_14:5, %dependency_write_out_15 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_9, %arg14, %dependency_write_out_7, %dependency_write_out_13, %dependency_write_out_11 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) dependency_write_in(%arg15, %arg16 : memref<32xi32>, memref<32xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg15, %arg16 : memref<32xi32>, memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32xi32>, %arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<32xi32>, %arg25: memref<32xi32>, %arg26: memref<32xi32>, %arg27: memref<32xi32>, %arg28: memref<32xi32>, %arg29: memref<32xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 136 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %89 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %90 = "neura.add"(%89) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %2 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%1#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.fused_op"(%20) <{frequency = 130 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %89 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.fused_op"(%19) <{frequency = 130 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %89 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25:3 = "neura.fused_op"(%24, %22) <{frequency = 30 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->mul->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %89 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.mul"(%89, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %91 = "neura.mul"(%89, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%89, %90, %91 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%25#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%25#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42:2 = "neura.fused_op"(%39, %18) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %43 = "neura.data_mov"(%42#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%42#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45:2 = "neura.fused_op"(%38, %17) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %46 = "neura.data_mov"(%45#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%45#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48:2 = "neura.fused_op"(%37, %16) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %49 = "neura.data_mov"(%48#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%48#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51:2 = "neura.fused_op"(%36, %15) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %52 = "neura.data_mov"(%51#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54:2 = "neura.fused_op"(%35, %14) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %55 = "neura.data_mov"(%54#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%54#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57:2 = "neura.fused_op"(%34, %13) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %58 = "neura.data_mov"(%57#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%57#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60:2 = "neura.fused_op"(%33, %12) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %61 = "neura.data_mov"(%60#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%60#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63:2 = "neura.fused_op"(%32, %11) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %64 = "neura.data_mov"(%63#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66:2 = "neura.fused_op"(%31, %10) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %67 = "neura.data_mov"(%66#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%66#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69:2 = "neura.fused_op"(%30, %9) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %70 = "neura.data_mov"(%69#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.data_mov"(%69#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72:2 = "neura.fused_op"(%29, %8) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %73 = "neura.data_mov"(%72#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.data_mov"(%72#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75:2 = "neura.fused_op"(%28, %7) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %76 = "neura.data_mov"(%75#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%75#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78:2 = "neura.fused_op"(%27, %6) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %79 = "neura.data_mov"(%78#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.data_mov"(%78#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81:2 = "neura.fused_op"(%26, %5) <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "mul->fused_op:add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<index, i1>):
          %89 = "neura.mul"(%arg30, %arg30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %90 = "neura.add"(%arg31) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %92 = "neura.mul"(%91, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %92 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %82 = "neura.data_mov"(%81#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%81#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%4, %40) <{frequency = 276 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %89 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %90 = "neura.mul"(%89, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %85 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %86:2 = "neura.fused_op"(%2, %41) <{frequency = 127 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %89 = "neura.add"(%arg30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %90 = neura.load_indexed [%89 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%89, %91 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %87 = "neura.data_mov"(%86#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.data_mov"(%86#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %88 to [%87 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %83 to [%82 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %80 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %77 to [%76 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %74 to [%73 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%70 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %68 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %65 to [%64 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %62 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %59 to [%58 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %56 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%52 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %50 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %47 to [%46 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.store_indexed %44 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) writes(%arg23 : memref<32xi32>)
    }
    return {latency = 1 : i32}
  }
}

