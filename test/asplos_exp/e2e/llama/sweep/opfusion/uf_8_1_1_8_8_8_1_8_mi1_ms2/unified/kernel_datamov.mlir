module {
  func.func @qk_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 35 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
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
        %17 = "neura.fused_op"(%10, %16) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %38 = "neura.fused_op"(%36, %37) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %50 = "neura.fused_op"(%48, %49) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %62 = "neura.fused_op"(%60, %61) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.fused_op"(%72, %73) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %86 = "neura.fused_op"(%84, %85) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %98 = "neura.fused_op"(%96, %97) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_exp(%arg0: memref<16xi32>, %arg1: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg1 : memref<16xi32>) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg1 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg4: memref<16xi32>, %arg5: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.fused_op"(%2) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg6: !neura.data<index, i1>):
          %8 = neura.load_indexed [%arg6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = "neura.mul"(%8, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %4 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %6 to [%7 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_norm(%arg0: memref<16xi32>, %arg1: memref<1xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %0 = memref.load %arg1[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg0 : memref<16xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg0 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg5: memref<16xi32>, %arg6: i32):
        %2:2 = "neura.fused_op"() <{frequency = 94 : i64, pattern_id = 2 : i64, pattern_name = "counter->load_indexed"}> ({
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%7, %8 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.div"(%4) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @sv_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 35 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
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
        %15 = neura.load_indexed [%11, %14 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%10, %16) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%13, %23 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %30 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%9) {latency = 1 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%32) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%36, %37) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%8) {latency = 1 : i32, rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%45, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%44) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.fused_op"(%48, %49) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = "neura.add"(%7) {latency = 1 : i32, rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.fused_op"(%60, %61) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%65) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %66 to [%67 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.add"(%6) {latency = 1 : i32, rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%69, %70 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%68) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.fused_op"(%72, %73) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = "neura.add"(%5) {latency = 1 : i32, rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%81, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%80) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.fused_op"(%84, %85) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %90 to [%91 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.add"(%4) {latency = 1 : i32, rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.fused_op"(%96, %97) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_gate(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 35 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
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
        %17 = "neura.fused_op"(%10, %16) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %38 = "neura.fused_op"(%36, %37) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %50 = "neura.fused_op"(%48, %49) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %62 = "neura.fused_op"(%60, %61) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.fused_op"(%72, %73) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %86 = "neura.fused_op"(%84, %85) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %98 = "neura.fused_op"(%96, %97) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_up(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 35 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
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
        %17 = "neura.fused_op"(%10, %16) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %38 = "neura.fused_op"(%36, %37) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %50 = "neura.fused_op"(%48, %49) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %62 = "neura.fused_op"(%60, %61) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.fused_op"(%72, %73) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %86 = "neura.fused_op"(%84, %85) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %98 = "neura.fused_op"(%96, %97) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_act(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%4, %5) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg9: !neura.data<index, i1>, %arg10: !neura.data<i32, i1>):
          %9 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%10 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %7 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_down(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 35 : i64, pattern_id = 1 : i64, pattern_name = "counter->add"}> ({
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
        %17 = "neura.fused_op"(%10, %16) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.fused_op"(%19, %18) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %21 to [%22 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.fused_op"(%12, %25) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.fused_op"(%28, %27) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %38 = "neura.fused_op"(%36, %37) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.fused_op"(%40, %39) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %50 = "neura.fused_op"(%48, %49) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.fused_op"(%52, %51) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %62 = "neura.fused_op"(%60, %61) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.fused_op"(%64, %63) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.fused_op"(%72, %73) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.fused_op"(%76, %75) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %86 = "neura.fused_op"(%84, %85) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.fused_op"(%88, %87) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %98 = "neura.fused_op"(%96, %97) <{frequency = 84 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.fused_op"(%100, %99) <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg10: !neura.data<index, i1>, %arg11: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

