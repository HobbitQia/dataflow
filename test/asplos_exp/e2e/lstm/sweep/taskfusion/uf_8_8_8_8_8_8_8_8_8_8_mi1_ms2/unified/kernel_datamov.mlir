module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg10, %arg0, %arg2 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10 : memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg11, %dependency_read_out#1, %arg3 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg11 : memref<16xi32>) [original_read_memrefs(%arg11, %arg0, %arg3 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg11 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg12, %dependency_read_out#1, %arg4 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg12 : memref<16xi32>) [original_read_memrefs(%arg12, %arg0, %arg4 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg12 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg13, %dependency_read_out#1, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg13 : memref<16xi32>) [original_read_memrefs(%arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg13 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%dependency_write_out, %arg1, %arg6 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out : memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%dependency_write_out_1, %dependency_read_out_6#1, %arg7 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out_1 : memref<16xi32>) [original_read_memrefs(%arg11, %arg1, %arg7 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg11 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_10:3, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_3, %dependency_read_out_6#1, %arg8 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out_3 : memref<16xi32>) [original_read_memrefs(%arg12, %arg1, %arg8 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg12 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%dependency_write_out_5, %dependency_read_out_6#1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out_5 : memref<16xi32>) [original_read_memrefs(%arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg13 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %105 = "neura.add"(%104) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 64 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg20 : memref<16xi32>)
    }
    %dependency_read_out_14:5, %dependency_write_out_15 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_9, %arg14, %dependency_write_out_7, %dependency_write_out_13, %dependency_write_out_11 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %90 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %91 = "neura.add"(%90) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%90, %91 : !neura.data<index, i1>, !neura.data<index, i1>)
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
        %11 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%1#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%13, %16) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = neura.load_indexed [%12 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input3"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.fused_op"(%11, %20) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%21) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23:2 = "neura.fused_op"(%18, %22) <{frequency = 16 : i64, pattern_id = 1 : i64, pattern_name = "add->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %90 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%90, %91 : !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %24 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.fused_op"(%10, %38) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %41 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.mul"(%37, %36) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%41) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.fused_op"(%43, %44) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%41) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %46 to [%47 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %48 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.mul"(%35, %34) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%48) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%50, %51) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%48) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %53 to [%54 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %55 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.mul"(%33, %32) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%55) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.fused_op"(%57, %58) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%55) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %60 to [%61 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %62 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.mul"(%31, %30) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%62) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.fused_op"(%64, %65) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%62) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %67 to [%68 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %69 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.mul"(%29, %28) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%69) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.fused_op"(%71, %72) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%69) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %74 to [%75 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %76 = "neura.add"(%3) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.mul"(%27, %26) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%76) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%78, %79) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%76) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %81 to [%82 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %83 = "neura.add"(%2) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.mul"(%25, %24) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.fused_op"(%85, %86) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %90 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %91 = "neura.mul"(%90, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%91 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%83) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %88 to [%89 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

