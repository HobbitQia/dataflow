module {
  func.func @llama_attention_ffn(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>, %arg3: memref<32xi32>, %arg4: memref<1xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>, %arg7: memref<32x32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>, %arg10: memref<32xi32>, %arg11: memref<32xi32>, %arg12: memref<32x32xi32>, %arg13: memref<32xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %c1_i32 = arith.constant {latency = 1 : i32} 1 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %126 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %128 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %129 = neura.load_indexed [%126, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %130 = "neura.add"(%128) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%126, %127, %128, %129, %130, %131 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%3#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%48, %66, %67) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %127 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %128 = "neura.mul"(%arg23, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %129 = "neura.add"(%126, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%64, %47, %49) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%63, %65, %46) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %127 = "neura.mul"(%126, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %129 = "neura.add"(%128, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%45 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%43 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%62, %42, %75) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%61, %39, %79) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %82 = neura.load_indexed [%37 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%60, %36, %83) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %85 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%34 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.fused_op"(%59, %33, %87) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.fused_op"(%58, %30, %91) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %93 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.fused_op"(%57, %27, %95) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %97 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %98 = neura.load_indexed [%25 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.fused_op"(%56, %24, %99) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %101 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %102 = neura.load_indexed [%22 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.fused_op"(%55, %21, %103) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %105 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %106 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%54, %18, %107) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %109 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %110 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%53, %15, %111) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %113 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = neura.load_indexed [%13 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%52, %12, %115) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %117 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %118 = neura.load_indexed [%10 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%51, %9, %119) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %121 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%7 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%50, %6, %123) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %125 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<32xi32>) dependency_write_in(%arg3 : memref<32xi32>) value_inputs(%c1_i32 : i32) [original_read_memrefs(%arg2 : memref<32xi32>), original_write_memrefs(%arg3 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg14, %arg16, %arg15 : memref<32xi32>, i32, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<32xi32>, %arg18: i32, %arg19: memref<32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%63) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = "neura.mul"(%67, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %69 = "neura.add"(%68) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %70 = "neura.add"(%63) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %72 = "neura.mul"(%71, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %73 = "neura.add"(%72) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65, %66, %69, %70, %73 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %17 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22:2 = "neura.fused_op"(%16) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %23 = "neura.data_mov"(%22#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25:2 = "neura.fused_op"(%15) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28:2 = "neura.fused_op"(%14) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %29 = "neura.data_mov"(%28#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31:2 = "neura.fused_op"(%13) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %32 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34:2 = "neura.fused_op"(%12) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37:2 = "neura.fused_op"(%11) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %38 = "neura.data_mov"(%37#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%37#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40:2 = "neura.fused_op"(%10) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %41 = "neura.data_mov"(%40#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:2 = "neura.fused_op"(%9) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%8) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49:2 = "neura.fused_op"(%7) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %50 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%49#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52:2 = "neura.fused_op"(%6) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %53 = "neura.data_mov"(%52#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%52#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55:2 = "neura.fused_op"(%5) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %56 = "neura.data_mov"(%55#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%55#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58:2 = "neura.fused_op"(%4) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %63 = "neura.add"(%arg20) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.mul"(%64, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %66 = "neura.add"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %66 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %59 = "neura.data_mov"(%58#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%58#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.add"(%17) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %19 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %24 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %30 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %36 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %39 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %42 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %48 to [%47 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%50 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %54 to [%53 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%56 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14 : memref<32xi32>) writes(%arg15 : memref<32xi32>)
    }
    %0 = memref.load %arg4[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out_1 : memref<32xi32>) dependency_write_in(%dependency_write_out_1 : memref<32xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg3 : memref<32xi32>), original_write_memrefs(%arg3 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg15, %arg16 : memref<32xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<32xi32>, %arg18: i32):
        %2:5 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:add->load_indexed->div->fused_op:fused_op:add->load_indexed->div"}> ({
          %63 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %64 = "neura.add"(%63) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %65 = neura.load_indexed [%64 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %66 = "neura.div"(%65) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %67 = "neura.add"(%63) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %69 = "neura.div"(%68) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %64, %66, %67, %69 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %19 = "neura.data_mov"(%2#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22:2 = "neura.fused_op"(%17) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %23 = "neura.data_mov"(%22#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25:2 = "neura.fused_op"(%16) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28:2 = "neura.fused_op"(%15) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %29 = "neura.data_mov"(%28#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31:2 = "neura.fused_op"(%14) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %32 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34:2 = "neura.fused_op"(%13) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37:2 = "neura.fused_op"(%12) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %38 = "neura.data_mov"(%37#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%37#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40:2 = "neura.fused_op"(%11) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %41 = "neura.data_mov"(%40#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:2 = "neura.fused_op"(%10) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%9) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49:2 = "neura.fused_op"(%8) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %50 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%49#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52:2 = "neura.fused_op"(%7) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %53 = "neura.data_mov"(%52#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%52#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55:2 = "neura.fused_op"(%6) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %56 = "neura.data_mov"(%55#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%55#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58:2 = "neura.fused_op"(%5) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %65 = "neura.div"(%64) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63, %65 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %59 = "neura.data_mov"(%58#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%58#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.fused_op"(%4) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %63 = neura.load_indexed [%arg19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %64 = "neura.div"(%63) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%64 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%56 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %54 to [%53 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%50 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %48 to [%47 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %42 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %39 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %36 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %30 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %24 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %19 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg15 : memref<32xi32>) writes(%arg15 : memref<32xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg6, %dependency_write_out_3, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg6 : memref<32xi32>) [original_read_memrefs(%arg6, %arg3, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg6 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %126 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %128 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %129 = neura.load_indexed [%128, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %130 = "neura.add"(%128) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%126, %127, %128, %129, %130, %131 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%3#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%48, %66, %67) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %127 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %128 = "neura.mul"(%arg23, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %129 = "neura.add"(%126, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%64, %47, %49) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%63, %65, %46) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %127 = "neura.mul"(%126, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %129 = "neura.add"(%128, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%45 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%43 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%62, %42, %75) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%61, %39, %79) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %82 = neura.load_indexed [%37 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%60, %36, %83) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %85 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%34 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.fused_op"(%59, %33, %87) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.fused_op"(%58, %30, %91) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %93 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.fused_op"(%57, %27, %95) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %97 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %98 = neura.load_indexed [%25 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.fused_op"(%56, %24, %99) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %101 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %102 = neura.load_indexed [%22 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.fused_op"(%55, %21, %103) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %105 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %106 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%54, %18, %107) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %109 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %110 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%53, %15, %111) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %113 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = neura.load_indexed [%13 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%52, %12, %115) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %117 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %118 = neura.load_indexed [%10 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%51, %9, %119) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %121 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%7 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%50, %6, %123) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%126, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %125 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%arg8, %dependency_write_out_5, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg8 : memref<32xi32>) [original_read_memrefs(%arg8, %arg6, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg8 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %126 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %128 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %129 = neura.load_indexed [%126, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %130 = "neura.add"(%128) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%126, %127, %128, %129, %130, %131 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%3#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%48, %66, %67) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %127 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %128 = "neura.mul"(%arg23, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %129 = "neura.add"(%126, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%64, %47, %49) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%63, %65, %46) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %127 = "neura.mul"(%126, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %129 = "neura.add"(%128, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%45 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%43 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%62, %42, %75) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%61, %39, %79) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %82 = neura.load_indexed [%37 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%60, %36, %83) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %85 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%34 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.fused_op"(%59, %33, %87) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.fused_op"(%58, %30, %91) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %93 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.fused_op"(%57, %27, %95) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %97 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %98 = neura.load_indexed [%25 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.fused_op"(%56, %24, %99) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %101 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %102 = neura.load_indexed [%22 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.fused_op"(%55, %21, %103) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %105 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %106 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%54, %18, %107) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %109 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %110 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%53, %15, %111) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %113 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = neura.load_indexed [%13 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%52, %12, %115) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %117 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %118 = neura.load_indexed [%10 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%51, %9, %119) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %121 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%7 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%50, %6, %123) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %125 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%arg10, %dependency_write_out_5, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg10 : memref<32xi32>) [original_read_memrefs(%arg10, %arg6, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %126 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %128 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %129 = neura.load_indexed [%126, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %130 = "neura.add"(%128) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%126, %127, %128, %129, %130, %131 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%3#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%48, %66, %67) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %127 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %128 = "neura.mul"(%arg23, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %129 = "neura.add"(%126, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%64, %47, %49) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%63, %65, %46) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %127 = "neura.mul"(%126, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %129 = "neura.add"(%128, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%45 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%43 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%62, %42, %75) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%61, %39, %79) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %82 = neura.load_indexed [%37 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%60, %36, %83) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %85 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%34 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.fused_op"(%59, %33, %87) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.fused_op"(%58, %30, %91) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %93 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.fused_op"(%57, %27, %95) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %97 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %98 = neura.load_indexed [%25 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.fused_op"(%56, %24, %99) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %101 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %102 = neura.load_indexed [%22 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.fused_op"(%55, %21, %103) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %105 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %106 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%54, %18, %107) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %109 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %110 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%53, %15, %111) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %113 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = neura.load_indexed [%13 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%52, %12, %115) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %117 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %118 = neura.load_indexed [%10 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%51, %9, %119) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %121 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%7 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%50, %6, %123) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %125 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_10:2, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_7, %dependency_write_out_9 : memref<32xi32>, memref<32xi32>) dependency_write_in(%arg11 : memref<32xi32>) [original_read_memrefs(%arg8, %arg10 : memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg14, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
          %66 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %68 = "neura.add"(%66) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %70 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %71 = "neura.mul"(%69, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %67, %68, %71 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
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
        %19 = "neura.data_mov"(%2#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22:2 = "neura.fused_op"(%18) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %23 = "neura.data_mov"(%22#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25:2 = "neura.fused_op"(%17) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %26 = "neura.data_mov"(%25#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28:2 = "neura.fused_op"(%16) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %29 = "neura.data_mov"(%28#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%28#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31:2 = "neura.fused_op"(%15) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %32 = "neura.data_mov"(%31#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%31#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34:2 = "neura.fused_op"(%14) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %35 = "neura.data_mov"(%34#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%34#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37:2 = "neura.fused_op"(%13) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %38 = "neura.data_mov"(%37#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%37#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40:2 = "neura.fused_op"(%12) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %41 = "neura.data_mov"(%40#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%40#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:2 = "neura.fused_op"(%11) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46:2 = "neura.fused_op"(%10) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %47 = "neura.data_mov"(%46#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49:2 = "neura.fused_op"(%9) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %50 = "neura.data_mov"(%49#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%49#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52:2 = "neura.fused_op"(%8) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %53 = "neura.data_mov"(%52#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%52#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55:2 = "neura.fused_op"(%7) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %56 = "neura.data_mov"(%55#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%55#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58:2 = "neura.fused_op"(%6) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %59 = "neura.data_mov"(%58#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%58#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61:2 = "neura.fused_op"(%5) <{frequency = 30 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %66 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %67 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %68 = neura.load_indexed [%66 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %69 = "neura.mul"(%67, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%66, %69 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %62 = "neura.data_mov"(%61#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%61#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.fused_op"(%4, %19) <{frequency = 224 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>, %arg21: !neura.data<i32, i1>):
          %66 = neura.load_indexed [%arg20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %67 = "neura.mul"(%66, %arg21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%67 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %65 to [%3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %63 to [%62 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %60 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %57 to [%56 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %54 to [%53 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %51 to [%50 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %48 to [%47 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %45 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %42 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %39 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %36 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %30 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %24 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %21 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14, %arg15 : memref<32xi32>, memref<32xi32>) writes(%arg16 : memref<32xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%arg13, %dependency_write_out_11, %arg12 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg13 : memref<32xi32>) [original_read_memrefs(%arg13, %arg11, %arg12 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %126 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %128 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %129 = neura.load_indexed [%126, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %130 = "neura.add"(%128) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%126, %127, %128, %129, %130, %131 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = "neura.data_mov"(%3#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = "neura.data_mov"(%3#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.data_mov"(%3#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%3#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%3#4) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%3#5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.fused_op"(%48, %66, %67) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %127 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %128 = "neura.mul"(%arg23, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %129 = "neura.add"(%126, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.fused_op"(%64, %47, %49) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.fused_op"(%63, %65, %46) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %126 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %127 = "neura.mul"(%126, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %129 = "neura.add"(%128, %127) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%129 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %73 to [%45 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %71 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%43 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.fused_op"(%62, %42, %75) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%41 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%40 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.fused_op"(%61, %39, %79) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %81 to [%38 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %82 = neura.load_indexed [%37 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.fused_op"(%60, %36, %83) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %85 to [%35 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%34 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.fused_op"(%59, %33, %87) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%32 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%31 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.fused_op"(%58, %30, %91) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %93 to [%29 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %94 = neura.load_indexed [%28 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.fused_op"(%57, %27, %95) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %97 to [%26 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %98 = neura.load_indexed [%25 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.fused_op"(%56, %24, %99) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %101 to [%23 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %102 = neura.load_indexed [%22 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.fused_op"(%55, %21, %103) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %105 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %106 = neura.load_indexed [%19 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.fused_op"(%54, %18, %107) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %109 to [%17 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %110 = neura.load_indexed [%16 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.fused_op"(%53, %15, %111) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %113 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = neura.load_indexed [%13 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.fused_op"(%52, %12, %115) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %117 to [%11 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %118 = neura.load_indexed [%10 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.fused_op"(%51, %9, %119) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %121 to [%8 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %122 = neura.load_indexed [%7 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.fused_op"(%50, %6, %123) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %126 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %127 = neura.load_indexed [%126 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %128 = neura.load_indexed [%arg22, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %130 = "neura.add"(%arg23, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%130 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %125 to [%5 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %69 to [%4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    return {latency = 1 : i32}
  }
}

