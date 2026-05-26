module {
  func.func @resnet_block(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c0_i32 = arith.constant {latency = 1 : i32} 0 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %105 = neura.load_indexed [%104 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14:2 = "neura.fused_op"(%11, %13) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18:2 = "neura.fused_op"(%10, %17) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22:2 = "neura.fused_op"(%9, %21) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %23 = "neura.data_mov"(%22#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26:2 = "neura.fused_op"(%8, %25) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %27 = "neura.data_mov"(%26#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30:2 = "neura.fused_op"(%7, %29) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34:2 = "neura.fused_op"(%6, %33) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38:2 = "neura.fused_op"(%5, %37) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %39 = "neura.data_mov"(%38#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%38#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.fused_op"(%41, %4, %12) <{frequency = 32 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>, %arg18: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.fused_op"(%44, %43) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %46 to [%47 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%39 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%40, %49) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%51, %52) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = neura.load_indexed [%35 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.mul"(%36, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%59, %60) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %62 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.mul"(%32, %65) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.fused_op"(%67, %68) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %70 to [%71 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%27 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.mul"(%28, %73) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.fused_op"(%75, %76) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = neura.load_indexed [%23 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.mul"(%24, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%83, %84) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %86 to [%87 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %88 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.mul"(%20, %89) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.fused_op"(%91, %92) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %94 to [%95 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%15 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%16, %97) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.fused_op"(%99, %100) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<4096xi32>) dependency_write_in(%arg3 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg2 : memref<4096xi32>), original_write_memrefs(%arg3 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg9, %arg11, %arg10 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: i32, %arg14: memref<4096xi32>):
        %1 = "neura.constant"() <{value = "%input1"}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
        %2:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %57 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12:2 = "neura.fused_op"(%10) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13 = "neura.data_mov"(%12#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%12#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.fused_op"(%14, %15) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18:2 = "neura.fused_op"(%9) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.fused_op"(%20, %21) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24:2 = "neura.fused_op"(%8) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %25 = "neura.data_mov"(%24#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%24#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%26, %27) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30:2 = "neura.fused_op"(%7) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%32, %33) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36:2 = "neura.fused_op"(%6) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %37 = "neura.data_mov"(%36#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%36#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.fused_op"(%38, %39) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42:2 = "neura.fused_op"(%5) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %43 = "neura.data_mov"(%42#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%42#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.fused_op"(%44, %45) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48:2 = "neura.fused_op"(%4) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %57 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%57, %58 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %49 = "neura.data_mov"(%48#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%48#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.fused_op"(%50, %51) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.fused_op"(%11, %54) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>):
          %57 = "neura.icmp"(%arg15) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %58 = "neura.sel"(%57, %arg15, %arg16) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%58 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %53 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %47 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %41 to [%37 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%31 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%25 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %23 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %17 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg9 : memref<4096xi32>) writes(%arg10 : memref<4096xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg6 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg6 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096x576xi32>, %arg11: memref<576xi32>, %arg12: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg13: memref<4096xi32>, %arg14: memref<4096x576xi32>, %arg15: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3:2 = "neura.fused_op"() <{frequency = 39 : i64, pattern_id = 3 : i64, pattern_name = "counter->load_indexed"}> ({
          %104 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %105 = neura.load_indexed [%104 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14:2 = "neura.fused_op"(%11, %13) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18:2 = "neura.fused_op"(%10, %17) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22:2 = "neura.fused_op"(%9, %21) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %23 = "neura.data_mov"(%22#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26:2 = "neura.fused_op"(%8, %25) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %27 = "neura.data_mov"(%26#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%26#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30:2 = "neura.fused_op"(%7, %29) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %31 = "neura.data_mov"(%30#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34:2 = "neura.fused_op"(%6, %33) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38:2 = "neura.fused_op"(%5, %37) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>):
          %104 = "neura.add"(%arg16) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %105 = neura.load_indexed [%arg17, %104 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%104, %105 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %39 = "neura.data_mov"(%38#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%38#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.fused_op"(%41, %4, %12) <{frequency = 32 : i64, pattern_id = 7 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<index, i1>, %arg18: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16, %arg17 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %105 = "neura.mul"(%104, %arg18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.fused_op"(%44, %43) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %46 to [%47 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%39 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%40, %49) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.fused_op"(%51, %52) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %56 = neura.load_indexed [%35 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.mul"(%36, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%59, %60) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %62 to [%63 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %64 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.mul"(%32, %65) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.fused_op"(%67, %68) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %70 to [%71 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%27 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.mul"(%28, %73) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.fused_op"(%75, %76) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %78 to [%79 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %80 = neura.load_indexed [%23 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.mul"(%24, %81) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.fused_op"(%83, %84) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %86 to [%87 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %88 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.mul"(%20, %89) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.fused_op"(%91, %92) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %94 to [%95 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%15 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%16, %97) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.fused_op"(%99, %100) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg16: !neura.data<index, i1>, %arg17: !neura.data<i32, i1>):
          %104 = neura.load_indexed [%arg16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %105 = "neura.add"(%104, %arg17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%105 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg12, %arg10, %arg11 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg12 : memref<4096xi32>)
    }
    %dependency_read_out_4:2, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_write_out_3, %arg7 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg8 : memref<4096xi32>) [original_read_memrefs(%arg6, %arg7 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg8 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg9: memref<4096xi32>, %arg10: memref<4096xi32>, %arg11: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg9, %arg10, %arg11 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg12: memref<4096xi32>, %arg13: memref<4096xi32>, %arg14: memref<4096xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3:2 = "neura.fused_op"(%2) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8:2 = "neura.fused_op"(%7) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%8#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%8#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13:2 = "neura.fused_op"(%12) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%13#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%13#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18:2 = "neura.fused_op"(%17) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %19 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%18#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%18#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23:2 = "neura.fused_op"(%22) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %24 = "neura.data_mov"(%23#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%23#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28:2 = "neura.fused_op"(%27) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %29 = "neura.data_mov"(%28#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%28#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33:2 = "neura.fused_op"(%32) <{frequency = 49 : i64, pattern_id = 0 : i64, pattern_name = "add->load_indexed"}> ({
        ^bb0(%arg15: !neura.data<index, i1>):
          %72 = "neura.add"(%arg15) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%72, %73 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %34 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%33#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%33#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.fused_op"(%39, %40) <{frequency = 32 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->add"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %72 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %73 = "neura.add"(%72, %arg16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%73 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = neura.load_indexed [%35 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.add"(%36, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %47 to [%34 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%30 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%31, %49) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %52 = neura.load_indexed [%25 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.add"(%26, %53) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %55 to [%24 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %56 = neura.load_indexed [%20 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.add"(%21, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %59 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %60 = neura.load_indexed [%15 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.add"(%16, %61) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %63 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %64 = neura.load_indexed [%10 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.add"(%11, %65) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %67 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        %68 = neura.load_indexed [%5 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.add"(%6, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %71 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg9, %arg10 : memref<4096xi32>, memref<4096xi32>) writes(%arg11 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
}

