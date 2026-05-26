module {
  func.func @lstm_cell(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32x32xi32>, %arg3: memref<32x32xi32>, %arg4: memref<32x32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32x32xi32>, %arg7: memref<32x32xi32>, %arg8: memref<32x32xi32>, %arg9: memref<32x32xi32>, %arg10: memref<32xi32>, %arg11: memref<32xi32>, %arg12: memref<32xi32>, %arg13: memref<32xi32>, %arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg10, %arg0, %arg2 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg10 : memref<32xi32>) [original_read_memrefs(%arg10, %arg0, %arg2 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_0:3, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%arg11, %dependency_read_out#1, %arg3 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg11 : memref<32xi32>) [original_read_memrefs(%arg11, %arg0, %arg3 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_2:3, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%arg12, %dependency_read_out#1, %arg4 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg12 : memref<32xi32>) [original_read_memrefs(%arg12, %arg0, %arg4 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg12 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg13, %dependency_read_out#1, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg13 : memref<32xi32>) [original_read_memrefs(%arg13, %arg0, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%dependency_write_out, %arg1, %arg6 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out : memref<32xi32>) [original_read_memrefs(%arg10, %arg1, %arg6 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%dependency_write_out_1, %dependency_read_out_6#1, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out_1 : memref<32xi32>) [original_read_memrefs(%arg11, %arg1, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_10:3, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_3, %dependency_read_out_6#1, %arg8 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out_3 : memref<32xi32>) [original_read_memrefs(%arg12, %arg1, %arg8 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg12 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%dependency_write_out_5, %dependency_read_out_6#1, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%dependency_write_out_5 : memref<32xi32>) [original_read_memrefs(%arg13, %arg1, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32x32xi32>, %arg20: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32x32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 40 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:counter->add->add->add"}> ({
          %42 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = "neura.add"(%42) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %44 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %45 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%42, %43, %44, %45 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        }) {latency = 1 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<index, i1>)
        %3 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%2#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%2#1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2#2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.data_mov"(%2#3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11:2 = "neura.fused_op"(%9) <{frequency = 64 : i64, pattern_id = 1 : i64, pattern_name = "counter->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>):
          %42 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %43 = neura.load_indexed [%42, %arg24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%42, %47 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%11#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%11#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.fused_op"(%7, %26) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%6, %25) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.fused_op"(%5, %24) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%32) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.fused_op"(%4, %23) <{frequency = 32 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = "neura.add"(%arg24) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %43 = neura.load_indexed [%arg25, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %44 = neura.load_indexed [%42 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %45 = "neura.mul"(%44, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %46 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %47 = "neura.add"(%46, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%47 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.fused_op"(%22, %8) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.fused_op"(%21, %3) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%20 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %37 to [%19 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %27 to [%18 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.fused_op"(%17, %10) <{frequency = 64 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:load_indexed->fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg24: !neura.data<index, i1>, %arg25: !neura.data<index, i1>):
          %42 = neura.load_indexed [%arg24, %arg25 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %43 = neura.load_indexed [%arg25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %44 = "neura.mul"(%43, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %45 = neura.load_indexed [%arg24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %46 = "neura.add"(%45, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%46 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %41 to [%16 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %35 to [%15 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %33 to [%14 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %31 to [%13 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %29 to [%12 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg20, %arg18, %arg19 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg20 : memref<32xi32>)
    }
    %dependency_read_out_14:5, %dependency_write_out_15 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_9, %arg14, %dependency_write_out_7, %dependency_write_out_13, %dependency_write_out_11 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) dependency_write_in(%arg15, %arg16 : memref<32xi32>, memref<32xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg15, %arg16 : memref<32xi32>, memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32xi32>, %arg21: memref<32xi32>, %arg22: memref<32xi32>, %arg23: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg24: memref<32xi32>, %arg25: memref<32xi32>, %arg26: memref<32xi32>, %arg27: memref<32xi32>, %arg28: memref<32xi32>, %arg29: memref<32xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 64 : i64, pattern_id = 2 : i64, pattern_name = "counter->add"}> ({
          %61 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %62 = "neura.add"(%61) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          neura.yield results(%61, %62 : !neura.data<index, i1>, !neura.data<index, i1>)
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
        %13 = "neura.fused_op"(%12) <{frequency = 66 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %61 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
          %62 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.fused_op"(%11) <{frequency = 66 : i64, pattern_id = 9 : i64, pattern_name = "load_indexed->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>):
          %61 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %62 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%63 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17:5 = "neura.fused_op"(%16, %14) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:fused_op:add->mul->mul->mul->mul"}> ({
        ^bb0(%arg30: !neura.data<i32, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %62 = "neura.mul"(%61, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %63 = "neura.mul"(%61, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %64 = "neura.mul"(%61, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %65 = "neura.mul"(%61, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %62, %63, %64, %65 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %18 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.data_mov"(%17#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%17#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%17#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%17#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%17#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.fused_op"(%10, %26) <{frequency = 140 : i64, pattern_id = 5 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = neura.load_indexed [%arg30 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %62 = "neura.mul"(%61, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%62 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%9 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %32:2 = "neura.fused_op"(%8, %27) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %33 = "neura.data_mov"(%32#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.data_mov"(%32#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %34 to [%33 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %35:2 = "neura.fused_op"(%7, %28) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %36 = "neura.data_mov"(%35#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.data_mov"(%35#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%36 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %38:2 = "neura.fused_op"(%6, %29) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %39 = "neura.data_mov"(%38#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = "neura.data_mov"(%38#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%39 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %41 = "neura.mul"(%25, %24) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43:2 = "neura.fused_op"(%5, %42) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %44 = "neura.data_mov"(%43#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.data_mov"(%43#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %45 to [%44 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %46 = "neura.mul"(%23, %22) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48:2 = "neura.fused_op"(%4, %47) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %49 = "neura.data_mov"(%48#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.data_mov"(%48#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%49 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %51 = "neura.mul"(%21, %20) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53:2 = "neura.fused_op"(%3, %52) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %54 = "neura.data_mov"(%53#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%53#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %55 to [%54 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        %56 = "neura.mul"(%19, %18) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58:2 = "neura.fused_op"(%2, %57) <{frequency = 55 : i64, pattern_id = 0 : i64, pattern_name = "add->fused_op:load_indexed->mul"}> ({
        ^bb0(%arg30: !neura.data<index, i1>, %arg31: !neura.data<i32, i1>):
          %61 = "neura.add"(%arg30) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
          %63 = "neura.mul"(%62, %arg31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%61, %63 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %59 = "neura.data_mov"(%58#0) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%58#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %60 to [%59 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) writes(%arg23 : memref<32xi32>)
    }
    return {latency = 1 : i32}
  }
}

