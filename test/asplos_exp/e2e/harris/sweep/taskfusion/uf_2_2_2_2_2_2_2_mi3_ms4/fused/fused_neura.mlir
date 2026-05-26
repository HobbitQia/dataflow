module {
  func.func @harris(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>, %arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>, %arg6: memref<64x64xi32>, %arg7: memref<64x64xi32>, %arg8: memref<64x64xi32>, %arg9: memref<64x64xi32>) {
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%7, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%12, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%15, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%8) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%16) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%11, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%19, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.add"(%22, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.sub"(%24, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%25, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.add"(%27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = neura.load_indexed [%28, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = neura.load_indexed [%31, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.add"(%27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%33, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.add"(%27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%36, %37 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%39, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.add"(%27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%32) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.mul"(%40) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%35, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.sub"(%43, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%46, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.sub"(%48, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%arg2 : memref<64x64xi32>) value_inputs(%c2_i32 : i32) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg2 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, i32) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg12, %arg11 : memref<64x64xi32>, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: i32, %arg15: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = neura.load_indexed [%4, %5 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = neura.load_indexed [%7, %8 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = neura.load_indexed [%2, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = neura.load_indexed [%2, %12 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%3) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%14, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = neura.load_indexed [%17, %18 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%11) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%13) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%16, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%19, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.add"(%22, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.sub"(%24, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%25, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.add"(%27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = neura.load_indexed [%28, %29 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %32 = "neura.add"(%27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = neura.load_indexed [%31, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.add"(%27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = neura.load_indexed [%2, %34 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = "neura.add"(%27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = neura.load_indexed [%2, %36 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.add"(%27) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%38, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.add"(%27) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%35) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.mul"(%37) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%40, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.sub"(%43, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%46, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.sub"(%48, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out : memref<64x64xi32>) dependency_write_in(%arg3 : memref<64x64xi32>) [original_read_memrefs(%arg1 : memref<64x64xi32>), original_write_memrefs(%arg3 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = "neura.mul"(%4, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%2, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_4, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%dependency_write_out_1 : memref<64x64xi32>) dependency_write_in(%arg4 : memref<64x64xi32>) [original_read_memrefs(%arg2 : memref<64x64xi32>), original_write_memrefs(%arg4 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = "neura.mul"(%4, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%2, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%7, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10 : memref<64x64xi32>) writes(%arg11 : memref<64x64xi32>)
    }
    %dependency_read_out_6:2, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%dependency_write_out, %dependency_write_out_1 : memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg5 : memref<64x64xi32>) [original_read_memrefs(%arg1, %arg2 : memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg5 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 2 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.mul"(%4, %5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%2, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = neura.load_indexed [%2, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %10 = "neura.mul"(%8, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%2, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11 : memref<64x64xi32>, memref<64x64xi32>) writes(%arg12 : memref<64x64xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_7, %dependency_write_out_5, %dependency_write_out_3 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) dependency_write_in(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) value_inputs(%c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32, %c2_i32, %c16_i32, %c4_i32 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) [original_read_memrefs(%arg5, %arg4, %arg3, %arg6, %arg7, %arg8 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>), original_write_memrefs(%arg8, %arg7, %arg6, %arg9 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg10: memref<64x64xi32>, %arg11: memref<64x64xi32>, %arg12: memref<64x64xi32>, %arg13: memref<64x64xi32>, %arg14: memref<64x64xi32>, %arg15: memref<64x64xi32>, %arg16: memref<64x64xi32>, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : index
      neura.kernel inputs(%arg10, %arg17, %arg18, %arg19, %arg11, %arg20, %arg21, %arg22, %arg12, %arg23, %arg24, %arg25, %arg26, %arg16 : memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, memref<64x64xi32>, i32, i32, i32, i32, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg27: memref<64x64xi32>, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: memref<64x64xi32>, %arg32: i32, %arg33: i32, %arg34: i32, %arg35: memref<64x64xi32>, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 2 : index, step = 1 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 2 : index, step = 2 : index, upper_bound = 62 : index} : !neura.data<index, i1>
        %4 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.add"(%4) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%5, %6 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = neura.load_indexed [%8, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%10, %11 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.add"(%4) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%2, %13 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%2, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%2, %16 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.add"(%4) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%18, %19 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%21, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.add"(%4) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%23, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.mul"(%15) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.mul"(%9) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%14) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%17) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.mul"(%22) {rhs_value = "%input2"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.add"(%7, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%31, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%32, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.add"(%33, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.add"(%34, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.add"(%35, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.add"(%36, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.add"(%37, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.div"(%38) {rhs_value = "%input3"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.add"(%40) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = neura.load_indexed [%41, %42 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %44 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = neura.load_indexed [%44, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %46 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = "neura.add"(%40) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = neura.load_indexed [%46, %47 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %49 = "neura.add"(%40) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = neura.load_indexed [%2, %49 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %51 = neura.load_indexed [%2, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %52 = "neura.add"(%40) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = neura.load_indexed [%2, %52 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %54 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.add"(%40) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = neura.load_indexed [%54, %55 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %57 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57, %40 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %59 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.add"(%40) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %62 = "neura.mul"(%51) {rhs_value = "%input5"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.mul"(%45) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%50) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.mul"(%53) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.mul"(%58) {rhs_value = "%input6"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.add"(%43, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.add"(%67, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.add"(%68, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.add"(%69, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.add"(%70, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.add"(%71, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.add"(%72, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%73, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.div"(%74) {rhs_value = "%input7"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.add"(%76) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = neura.load_indexed [%77, %78 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %80 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = neura.load_indexed [%80, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %82 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.add"(%76) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = neura.load_indexed [%82, %83 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %85 = "neura.add"(%76) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = neura.load_indexed [%2, %85 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %87 = neura.load_indexed [%2, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %88 = "neura.add"(%76) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%2, %88 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %90 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.add"(%76) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%90, %91 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %93 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%93, %76 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %95 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = "neura.add"(%76) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %97 = neura.load_indexed [%95, %96 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %98 = "neura.mul"(%87) {rhs_value = "%input9"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.mul"(%81) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.mul"(%86) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.mul"(%89) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.mul"(%94) {rhs_value = "%input10"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.add"(%79, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.add"(%103, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.add"(%104, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.add"(%105, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.add"(%106, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.add"(%107, %92) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.add"(%108, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.add"(%109, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.div"(%110) {rhs_value = "%input11"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.mul"(%111, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.mul"(%39, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.sub"(%112, %113) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.add"(%111, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.mul"(%115, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.mul"(%116) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.sub"(%114, %117) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %118 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        %119 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %120 = "neura.mul"(%111, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.mul"(%39, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.sub"(%120, %121) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.add"(%111, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.mul"(%123, %123) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.mul"(%124) {lhs_value = "%input12"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.sub"(%122, %125) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %126 to [%2, %119 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input13"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg10, %arg11, %arg12 : memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) writes(%arg16 : memref<64x64xi32>)
    }
    return
  }
}

