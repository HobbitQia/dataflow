module {
  func.func @sobel_y(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<64x64xi32>) dependency_write_in(%arg1 : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 1 : index, step = 4 : index, upper_bound = 61 : index} : !neura.data<index, i1>
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
        %20 = "neura.mul"(%11) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%16, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%19, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.add"(%22, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.sub"(%24, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%25, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %44 = "neura.mul"(%35) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.mul"(%37) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sub"(%40, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.sub"(%43, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.add"(%46, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.sub"(%48, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %50 to [%2, %27 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %51 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %53 = "neura.add"(%51) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = neura.load_indexed [%52, %53 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %55 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.add"(%51) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = neura.load_indexed [%55, %56 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %58 = "neura.add"(%51) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%2, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.add"(%51) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%2, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %62 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.add"(%51) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%62, %63 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.add"(%51) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = neura.load_indexed [%65, %66 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %68 = "neura.mul"(%59) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.mul"(%61) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.sub"(%64, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.sub"(%67, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.add"(%70, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.sub"(%72, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%73, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %74 to [%2, %51 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %79 = "neura.add"(%2) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %81 = neura.load_indexed [%79, %80 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %82 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = neura.load_indexed [%2, %82 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %84 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %86 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.add"(%75) {rhs_value = -1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%86, %87 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = "neura.add"(%2) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.add"(%75) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = neura.load_indexed [%89, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.mul"(%83) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.mul"(%85) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.sub"(%88, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.sub"(%91, %81) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.add"(%94, %92) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.sub"(%96, %93) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.add"(%97, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %98 to [%2, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_read_out : memref<64x64xi32>) dependency_write_in(%dependency_write_out : memref<64x64xi32>) [original_read_memrefs(%arg0 : memref<64x64xi32>), original_write_memrefs(%arg1 : memref<64x64xi32>)] : (memref<64x64xi32>, memref<64x64xi32>) -> (memref<64x64xi32>, memref<64x64xi32>) {
    ^bb0(%arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<64x64xi32>, memref<64x64xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<64x64xi32>, %arg5: memref<64x64xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 1 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 61 : index, step = 1 : index, upper_bound = 63 : index} : !neura.data<index, i1>
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
        %20 = "neura.mul"(%11) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.mul"(%13) {rhs_value = 2 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sub"(%16, %6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.sub"(%19, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.add"(%22, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.sub"(%24, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.add"(%25, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<64x64xi32>) writes(%arg3 : memref<64x64xi32>)
    }
    return
  }
}

