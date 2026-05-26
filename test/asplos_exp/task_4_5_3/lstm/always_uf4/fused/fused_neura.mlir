module {
  func.func @lstm_cell(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16x16xi32>, %arg3: memref<16x16xi32>, %arg4: memref<16x16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16x16xi32>, %arg7: memref<16x16xi32>, %arg8: memref<16x16xi32>, %arg9: memref<16x16xi32>, %arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>, %arg15: memref<16xi32>, %arg16: memref<16xi32>) {
    %dependency_read_out:9, %dependency_write_out:4 = taskflow.task @fused_sibling dependency_read_in(%arg10, %arg0, %arg2, %arg11, %arg3, %arg12, %arg4, %arg13, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg0, %arg2, %arg11, %arg0, %arg3, %arg12, %arg0, %arg4, %arg13, %arg0, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
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
        %27 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %30 = "neura.mul"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.add"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %32 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %34 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%2, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.add"(%33, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %38 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %40 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%2, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %42 = "neura.mul"(%40, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%39, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %43 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %44 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %46 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%2, %44 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %48 = "neura.mul"(%46, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.add"(%45, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %49 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %51 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %52 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %53 = "neura.mul"(%51, %52) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.add"(%50, %53) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %54 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %55 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %57 = neura.load_indexed [%55 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %58 = neura.load_indexed [%2, %55 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %59 = "neura.mul"(%57, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.add"(%56, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %60 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %61 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %63 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %64 = neura.load_indexed [%2, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %65 = "neura.mul"(%63, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.add"(%62, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %66 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %67 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %69 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %70 = neura.load_indexed [%2, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %71 = "neura.mul"(%69, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.add"(%68, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %72 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %73 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %76 = "neura.mul"(%74, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.add"(%73, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        %78 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %80 = neura.load_indexed [%78 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %81 = neura.load_indexed [%2, %78 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %82 = "neura.mul"(%80, %81) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%79, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %83 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        %84 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%84 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %87 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %88 = "neura.mul"(%86, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.add"(%85, %88) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        %90 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %92 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = neura.load_indexed [%2, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %94 = "neura.mul"(%92, %93) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%91, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %95 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_0:9, %dependency_write_out_1:4 = taskflow.task @fused_sibling dependency_read_in(%dependency_write_out#0, %arg1, %arg6, %dependency_write_out#1, %arg7, %dependency_write_out#2, %arg8, %dependency_write_out#3, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%dependency_write_out#0, %dependency_write_out#1, %dependency_write_out#2, %dependency_write_out#3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg10, %arg1, %arg6, %arg11, %arg1, %arg7, %arg12, %arg1, %arg8, %arg13, %arg1, %arg9 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg10, %arg11, %arg12, %arg13 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16x16xi32>, %arg20: memref<16xi32>, %arg21: memref<16x16xi32>, %arg22: memref<16xi32>, %arg23: memref<16x16xi32>, %arg24: memref<16xi32>, %arg25: memref<16x16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg26, %arg18, %arg19, %arg27, %arg21, %arg28, %arg23, %arg29, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg30: memref<16xi32>, %arg31: memref<16xi32>, %arg32: memref<16x16xi32>, %arg33: memref<16xi32>, %arg34: memref<16x16xi32>, %arg35: memref<16xi32>, %arg36: memref<16x16xi32>, %arg37: memref<16xi32>, %arg38: memref<16x16xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
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
        %27 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %28 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %30 = "neura.mul"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.add"(%27, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %31 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %32 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %34 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %35 = neura.load_indexed [%2, %32 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.add"(%33, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %37 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %38 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %40 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %41 = neura.load_indexed [%2, %38 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %42 = "neura.mul"(%40, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.add"(%39, %42) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %43 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %44 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %46 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %47 = neura.load_indexed [%2, %44 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %48 = "neura.mul"(%46, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.add"(%45, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %49 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input3"} : !neura.data<i32, i1>
        %50 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %51 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %52 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %53 = "neura.mul"(%51, %52) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.add"(%50, %53) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %54 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %55 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %57 = neura.load_indexed [%55 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %58 = neura.load_indexed [%2, %55 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %59 = "neura.mul"(%57, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.add"(%56, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %60 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %61 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %63 = neura.load_indexed [%61 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %64 = neura.load_indexed [%2, %61 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %65 = "neura.mul"(%63, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.add"(%62, %65) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %66 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %67 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input5"} : !neura.data<i32, i1>
        %69 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %70 = neura.load_indexed [%2, %67 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input6"} : !neura.data<i32, i1>
        %71 = "neura.mul"(%69, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.add"(%68, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %72 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %73 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %74 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %75 = neura.load_indexed [%2, %3 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %76 = "neura.mul"(%74, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.add"(%73, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %77 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        %78 = "neura.add"(%3) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %80 = neura.load_indexed [%78 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %81 = neura.load_indexed [%2, %78 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %82 = "neura.mul"(%80, %81) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.add"(%79, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %83 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        %84 = "neura.add"(%3) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %86 = neura.load_indexed [%84 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %87 = neura.load_indexed [%2, %84 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %88 = "neura.mul"(%86, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %89 = "neura.add"(%85, %88) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %89 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        %90 = "neura.add"(%3) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input7"} : !neura.data<i32, i1>
        %92 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = neura.load_indexed [%2, %90 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input8"} : !neura.data<i32, i1>
        %94 = "neura.mul"(%92, %93) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.add"(%91, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %95 to [%2 : !neura.data<index, i1>]  {rhs_value = "%input7"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg26, %arg27, %arg28, %arg29 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>)
    }
    %dependency_read_out_2:5, %dependency_write_out_3 = taskflow.task @fused_pc dependency_read_in(%dependency_write_out_1#1, %arg14, %dependency_write_out_1#0, %dependency_write_out_1#3, %dependency_write_out_1#2 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg15, %arg16 : memref<16xi32>, memref<16xi32>) [original_read_memrefs(%arg11, %arg14, %arg10, %arg13, %arg12, %arg15 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg15, %arg16 : memref<16xi32>, memref<16xi32>)] : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg17: memref<16xi32>, %arg18: memref<16xi32>, %arg19: memref<16xi32>, %arg20: memref<16xi32>, %arg21: memref<16xi32>, %arg22: memref<16xi32>, %arg23: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg17, %arg18, %arg19, %arg20, %arg21, %arg23 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg24: memref<16xi32>, %arg25: memref<16xi32>, %arg26: memref<16xi32>, %arg27: memref<16xi32>, %arg28: memref<16xi32>, %arg29: memref<16xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 4 : index, upper_bound = 16 : index} : !neura.data<index, i1>
        %2 = "neura.add"(%1) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %5 = "neura.mul"(%3, %4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.add"(%5, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = neura.load_indexed [%1 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %11 = "neura.mul"(%9, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.mul"(%10, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%1 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %13 = "neura.add"(%1) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %15 = "neura.mul"(%9, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.mul"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%13 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %17 = "neura.add"(%1) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %19 = "neura.mul"(%9, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%17 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        %21 = "neura.add"(%1) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input4"} : !neura.data<i32, i1>
        %23 = "neura.mul"(%9, %9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.mul"(%22, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%21 : !neura.data<index, i1>]  {rhs_value = "%input5"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg18, %arg19, %arg20, %arg21 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg23 : memref<16xi32>)
    }
    return
  }
}

