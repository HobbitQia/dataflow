module {
  func.func @qk_attention(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.mul"(%5, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%4, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.add"(%10, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%16, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %31 = "neura.mul"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.add"(%3) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%2, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.mul"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.add"(%40, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.add"(%3) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%2, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.mul"(%47, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%46, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %54 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %55 = "neura.mul"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%52, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.add"(%3) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = neura.load_indexed [%2, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.mul"(%59, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.add"(%58, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.add"(%3) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = neura.load_indexed [%2, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %67 = "neura.mul"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.add"(%64, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %68 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %69 = "neura.add"(%3) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %71 = neura.load_indexed [%69 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%2, %69 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.mul"(%71, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%70, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %74 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.mul"(%77, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.add"(%76, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %80 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.add"(%3) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = neura.load_indexed [%81 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %84 = neura.load_indexed [%2, %81 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %85 = "neura.mul"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.add"(%82, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %86 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%3) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = neura.load_indexed [%87 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %91 = "neura.mul"(%89, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%88, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %92 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %93 = "neura.add"(%3) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = neura.load_indexed [%93 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%2, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.mul"(%95, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.add"(%94, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @softmax_exp(%arg0: memref<32xi32>, %arg1: memref<32xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<32xi32>) dependency_write_in(%arg1 : memref<32xi32>) [original_read_memrefs(%arg0 : memref<32xi32>), original_write_memrefs(%arg1 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg2: memref<32xi32>, %arg3: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<32xi32>, %arg5: memref<32xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %2 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %3 = "neura.mul"(%2, %2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.add"(%3) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %4 to [%1 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %5 = "neura.add"(%1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = neura.load_indexed [%5 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = "neura.mul"(%6, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%7) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%5 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %9 = "neura.add"(%1) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = "neura.mul"(%10, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.add"(%11) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%9 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %13 = "neura.add"(%1) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.mul"(%14, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.add"(%15) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%13 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %17 = "neura.add"(%1) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%19) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%17 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %21 = "neura.add"(%1) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.mul"(%22, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.add"(%23) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%21 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.add"(%1) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.mul"(%26, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.add"(%27) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%25 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %29 = "neura.add"(%1) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = neura.load_indexed [%29 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.mul"(%30, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%31) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%29 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %33 = "neura.add"(%1) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = "neura.mul"(%34, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.add"(%35) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %36 to [%33 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %37 = "neura.add"(%1) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.mul"(%38, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.add"(%39) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%37 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %41 = "neura.add"(%1) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = neura.load_indexed [%41 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %43 = "neura.mul"(%42, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.add"(%43) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%41 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %45 = "neura.add"(%1) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = "neura.mul"(%46, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%47) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %48 to [%45 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %49 = "neura.add"(%1) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.mul"(%50, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.add"(%51) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %52 to [%49 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %53 = "neura.add"(%1) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = neura.load_indexed [%53 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %55 = "neura.mul"(%54, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%55) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%53 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %57 = "neura.add"(%1) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = "neura.mul"(%58, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.add"(%59) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %60 to [%57 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %61 = "neura.add"(%1) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.mul"(%62, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.add"(%63) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %64 to [%61 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<32xi32>) writes(%arg3 : memref<32xi32>)
    }
    return
  }
  func.func @softmax_norm(%arg0: memref<32xi32>, %arg1: memref<1xi32>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg1[%c0] : memref<1xi32>
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<32xi32>) dependency_write_in(%arg0 : memref<32xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg0 : memref<32xi32>), original_write_memrefs(%arg0 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg2: memref<32xi32>, %arg3: memref<32xi32>, %arg4: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<32xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg5: memref<32xi32>, %arg6: i32):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
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
        %26 = "neura.add"(%2) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.div"(%27) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%26 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.add"(%2) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = neura.load_indexed [%29 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = "neura.div"(%30) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%29 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.add"(%2) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %34 = "neura.div"(%33) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %34 to [%32 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = "neura.add"(%2) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %37 = "neura.div"(%36) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%35 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %38 = "neura.add"(%2) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.div"(%39) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%38 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = "neura.add"(%2) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = neura.load_indexed [%41 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %43 = "neura.div"(%42) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %43 to [%41 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %44 = "neura.add"(%2) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.div"(%45) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %46 to [%44 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = "neura.add"(%2) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %48 = neura.load_indexed [%47 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %49 = "neura.div"(%48) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %49 to [%47 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3 : memref<32xi32>) writes(%arg3 : memref<32xi32>)
    }
    return
  }
  func.func @sv_attention(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%3, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.mul"(%5, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%4, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%9, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.add"(%10, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%15, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%16, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%21, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%27, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %31 = "neura.mul"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.add"(%3) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%33, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.mul"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%39, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.add"(%40, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.add"(%3) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%45, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.mul"(%47, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%46, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %54 = neura.load_indexed [%51, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %55 = "neura.mul"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%52, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.add"(%3) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = neura.load_indexed [%57, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.mul"(%59, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.add"(%58, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.add"(%3) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = neura.load_indexed [%63, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %67 = "neura.mul"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.add"(%64, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %68 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %69 = "neura.add"(%3) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %71 = neura.load_indexed [%69 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%69, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.mul"(%71, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%70, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %74 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%75, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.mul"(%77, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.add"(%76, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %80 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.add"(%3) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = neura.load_indexed [%81 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %84 = neura.load_indexed [%81, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %85 = "neura.mul"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.add"(%82, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %86 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%3) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = neura.load_indexed [%87 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%87, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %91 = "neura.mul"(%89, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%88, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %92 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %93 = "neura.add"(%3) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = neura.load_indexed [%93 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%93, %2 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.mul"(%95, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.add"(%94, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_gate(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.mul"(%5, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%4, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.add"(%10, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%16, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %31 = "neura.mul"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.add"(%3) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%2, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.mul"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.add"(%40, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.add"(%3) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%2, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.mul"(%47, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%46, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %54 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %55 = "neura.mul"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%52, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.add"(%3) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = neura.load_indexed [%2, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.mul"(%59, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.add"(%58, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.add"(%3) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = neura.load_indexed [%2, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %67 = "neura.mul"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.add"(%64, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %68 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %69 = "neura.add"(%3) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %71 = neura.load_indexed [%69 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%2, %69 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.mul"(%71, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%70, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %74 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.mul"(%77, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.add"(%76, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %80 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.add"(%3) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = neura.load_indexed [%81 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %84 = neura.load_indexed [%2, %81 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %85 = "neura.mul"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.add"(%82, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %86 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%3) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = neura.load_indexed [%87 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %91 = "neura.mul"(%89, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%88, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %92 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %93 = "neura.add"(%3) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = neura.load_indexed [%93 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%2, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.mul"(%95, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.add"(%94, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_up(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.mul"(%5, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%4, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.add"(%10, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%16, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %31 = "neura.mul"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.add"(%3) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%2, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.mul"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.add"(%40, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.add"(%3) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%2, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.mul"(%47, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%46, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %54 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %55 = "neura.mul"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%52, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.add"(%3) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = neura.load_indexed [%2, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.mul"(%59, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.add"(%58, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.add"(%3) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = neura.load_indexed [%2, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %67 = "neura.mul"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.add"(%64, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %68 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %69 = "neura.add"(%3) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %71 = neura.load_indexed [%69 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%2, %69 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.mul"(%71, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%70, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %74 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.mul"(%77, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.add"(%76, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %80 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.add"(%3) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = neura.load_indexed [%81 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %84 = neura.load_indexed [%2, %81 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %85 = "neura.mul"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.add"(%82, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %86 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%3) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = neura.load_indexed [%87 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %91 = "neura.mul"(%89, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%88, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %92 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %93 = "neura.add"(%3) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = neura.load_indexed [%93 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%2, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.mul"(%95, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.add"(%94, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_act(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<32xi32>, memref<32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg0, %arg1 : memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<32xi32>, %arg7: memref<32xi32>, %arg8: memref<32xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %2 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %3 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %4 = "neura.mul"(%2, %3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %4 to [%1 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %5 = "neura.add"(%1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = neura.load_indexed [%5 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%5 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%5 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %9 = "neura.add"(%1) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = "neura.mul"(%10, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%9 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.add"(%1) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%13 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %17 = "neura.add"(%1) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%17 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %21 = "neura.add"(%1) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = "neura.mul"(%22, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%21 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.add"(%1) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %28 = "neura.mul"(%26, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%25 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %29 = "neura.add"(%1) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = neura.load_indexed [%29 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%29 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %32 = "neura.mul"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%29 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %33 = "neura.add"(%1) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %36 to [%33 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.add"(%1) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %40 = "neura.mul"(%38, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %40 to [%37 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %41 = "neura.add"(%1) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = neura.load_indexed [%41 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %43 = neura.load_indexed [%41 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %44 = "neura.mul"(%42, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%41 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.add"(%1) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = "neura.mul"(%46, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %48 to [%45 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.add"(%1) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = neura.load_indexed [%49 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %52 = "neura.mul"(%50, %51) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %52 to [%49 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.add"(%1) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = neura.load_indexed [%53 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %55 = neura.load_indexed [%53 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %56 = "neura.mul"(%54, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%53 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %57 = "neura.add"(%1) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = "neura.mul"(%58, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %60 to [%57 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.add"(%1) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %64 = "neura.mul"(%62, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %64 to [%61 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<32xi32>, memref<32xi32>) writes(%arg5 : memref<32xi32>)
    }
    return
  }
  func.func @ffn_down(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = "neura.mul"(%5, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%4, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %12 = neura.load_indexed [%2, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.add"(%10, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %18 = neura.load_indexed [%2, %15 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.add"(%16, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %24 = neura.load_indexed [%2, %21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%22, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = "neura.add"(%3) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %30 = neura.load_indexed [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %31 = "neura.mul"(%29, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.add"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.add"(%3) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %36 = neura.load_indexed [%2, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.mul"(%35, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.add"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %38 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %39 = "neura.add"(%3) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = neura.load_indexed [%2, %39 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %43 = "neura.mul"(%41, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %44 = "neura.add"(%40, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %44 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.add"(%3) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%45 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = neura.load_indexed [%2, %45 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.mul"(%47, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%46, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %54 = neura.load_indexed [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %55 = "neura.mul"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.add"(%52, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %56 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.add"(%3) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = neura.load_indexed [%2, %57 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.mul"(%59, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.add"(%58, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %62 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %63 = "neura.add"(%3) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = neura.load_indexed [%2, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %67 = "neura.mul"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.add"(%64, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %68 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %69 = "neura.add"(%3) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %70 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %71 = neura.load_indexed [%69 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %72 = neura.load_indexed [%2, %69 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.mul"(%71, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%70, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %74 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %78 = neura.load_indexed [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.mul"(%77, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.add"(%76, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %80 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.add"(%3) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %83 = neura.load_indexed [%81 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %84 = neura.load_indexed [%2, %81 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %85 = "neura.mul"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.add"(%82, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %86 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.add"(%3) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = neura.load_indexed [%87 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = neura.load_indexed [%2, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %91 = "neura.mul"(%89, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.add"(%88, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %92 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %93 = "neura.add"(%3) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %95 = neura.load_indexed [%93 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %96 = neura.load_indexed [%2, %93 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %97 = "neura.mul"(%95, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.add"(%94, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
}

