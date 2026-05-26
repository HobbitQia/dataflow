module {
  func.func @llama_attention_ffn(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>, %arg3: memref<32xi32>, %arg4: memref<1xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>, %arg7: memref<32x32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>, %arg10: memref<32xi32>, %arg11: memref<32xi32>, %arg12: memref<32x32xi32>, %arg13: memref<32xi32>) {
    %c0 = arith.constant 0 : index
    %c1_i32 = arith.constant 1 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%5, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%12, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%4) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.add"(%17, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%4) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%24, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%4) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.add"(%4) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %37 = neura.load_indexed [%3, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %38 = "neura.mul"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%35, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = neura.load_indexed [%3, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%42, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.add"(%41, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %45 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.add"(%4) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = neura.load_indexed [%3, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.add"(%47, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<32xi32>) dependency_write_in(%arg3 : memref<32xi32>) value_inputs(%c1_i32 : i32) [original_read_memrefs(%arg2 : memref<32xi32>), original_write_memrefs(%arg3 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg14, %arg16, %arg15 : memref<32xi32>, i32, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg17: memref<32xi32>, %arg18: i32, %arg19: memref<32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.mul"(%3, %3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.add"(%4) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %6 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%8) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%6 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %10 = "neura.add"(%2) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.mul"(%11, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.add"(%12) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%10 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.add"(%2) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.mul"(%15, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.add"(%16) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%14 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %18 = "neura.add"(%2) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%19, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.add"(%20) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%18 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %22 = "neura.add"(%2) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.mul"(%23, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.add"(%24) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%22 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.add"(%2) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.mul"(%27, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.add"(%28) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%26 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %30 = "neura.add"(%2) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%31, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%30 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg14 : memref<32xi32>) writes(%arg15 : memref<32xi32>)
    }
    %0 = memref.load %arg4[%c0] : memref<1xi32>
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out_1 : memref<32xi32>) dependency_write_in(%dependency_write_out_1 : memref<32xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg3 : memref<32xi32>), original_write_memrefs(%arg3 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg15, %arg16 : memref<32xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg17: memref<32xi32>, %arg18: i32):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.div"(%3) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %4 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = neura.load_indexed [%5 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.div"(%6) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %7 to [%5 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.add"(%2) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = neura.load_indexed [%8 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.div"(%9) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%8 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.add"(%2) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.div"(%12) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%11 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.add"(%2) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.div"(%15) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%14 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.add"(%2) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %19 to [%17 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.add"(%2) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = neura.load_indexed [%20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.div"(%21) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%20 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.add"(%2) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.div"(%24) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%23 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg15 : memref<32xi32>) writes(%arg15 : memref<32xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg6, %dependency_write_out_3, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg6 : memref<32xi32>) [original_read_memrefs(%arg6, %arg3, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg6 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%4, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%5, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%10, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%12, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%4) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%16, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.add"(%17, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%4) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%22, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%24, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%4) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%28, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.add"(%4) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %37 = neura.load_indexed [%34, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %38 = "neura.mul"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%35, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = neura.load_indexed [%40, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%42, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.add"(%41, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %45 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.add"(%4) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = neura.load_indexed [%46, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.add"(%47, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%arg8, %dependency_write_out_5, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg8 : memref<32xi32>) [original_read_memrefs(%arg8, %arg6, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg8 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%5, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%12, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%4) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.add"(%17, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%4) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%24, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%4) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.add"(%4) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %37 = neura.load_indexed [%3, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %38 = "neura.mul"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%35, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = neura.load_indexed [%3, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%42, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.add"(%41, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %45 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.add"(%4) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = neura.load_indexed [%3, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.add"(%47, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%arg10, %dependency_write_out_5, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg10 : memref<32xi32>) [original_read_memrefs(%arg10, %arg6, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%5, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%12, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%4) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.add"(%17, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%4) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%24, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%4) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.add"(%4) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %37 = neura.load_indexed [%3, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %38 = "neura.mul"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%35, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = neura.load_indexed [%3, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%42, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.add"(%41, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %45 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.add"(%4) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = neura.load_indexed [%3, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.add"(%47, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_10:2, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_7, %dependency_write_out_9 : memref<32xi32>, memref<32xi32>) dependency_write_in(%arg11 : memref<32xi32>) [original_read_memrefs(%arg8, %arg10 : memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg14, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %5 = "neura.mul"(%3, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %6 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %9 = "neura.mul"(%7, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%6 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %10 = "neura.add"(%2) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%10 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.add"(%2) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = neura.load_indexed [%14 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = neura.load_indexed [%14 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %17 = "neura.mul"(%15, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %17 to [%14 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %18 = "neura.add"(%2) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %21 = "neura.mul"(%19, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%18 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %22 = "neura.add"(%2) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %25 to [%22 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.add"(%2) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %29 = "neura.mul"(%27, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %29 to [%26 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %30 = "neura.add"(%2) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = neura.load_indexed [%30 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %33 = "neura.mul"(%31, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%30 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg14, %arg15 : memref<32xi32>, memref<32xi32>) writes(%arg16 : memref<32xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%arg13, %dependency_write_out_11, %arg12 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg13 : memref<32xi32>) [original_read_memrefs(%arg13, %arg11, %arg12 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%5, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.mul"(%12, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.add"(%11, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %15 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%4) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.add"(%17, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %21 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.add"(%4) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%22 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3, %22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%24, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.add"(%23, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %27 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.add"(%4) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%28 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3, %28 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%29, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %33 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.add"(%4) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%34 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %37 = neura.load_indexed [%3, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %38 = "neura.mul"(%36, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%35, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %39 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.add"(%4) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = neura.load_indexed [%3, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%42, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.add"(%41, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %45 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.add"(%4) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = neura.load_indexed [%3, %46 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.add"(%47, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %51 to [%3 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    return
  }
}

