module {
  func.func @conv2d_1(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%6, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.add"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.add"(%19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%23, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%27) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.mul"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%31, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %34 to [%35 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.add"(%36) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.mul"(%45, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %51 to [%52 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.add"(%53) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = neura.load_indexed [%55 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%60 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%62, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.add"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %68 to [%69 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %70 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.add"(%70) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%74, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%77 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.mul"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.add"(%82, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %85 to [%86 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.add"(%87) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = neura.load_indexed [%89 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%91, %92 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%94 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.add"(%99, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %104 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.add"(%104) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = neura.load_indexed [%106 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %108 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = neura.load_indexed [%108, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%111 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.mul"(%113, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.add"(%116, %117) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %119 to [%120 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %121 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.add"(%121) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%123 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %125 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = neura.load_indexed [%125, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return
  }
  func.func @relu(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<4096xi32>) dependency_write_in(%arg1 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg0 : memref<4096xi32>), original_write_memrefs(%arg1 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg2, %arg4, %arg3 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg5: memref<4096xi32>, %arg6: i32, %arg7: memref<4096xi32>):
        %1 = "neura.constant"() <{value = "%input1"}> : () -> !neura.data<i32, i1>
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.icmp"(%5) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %8 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.sel"(%7, %8, %9) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %11 to [%12 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.add"(%13) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.data_mov"(%14) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.icmp"(%17) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %20 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.sel"(%19, %20, %21) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%14) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %23 to [%24 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.add"(%25) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.icmp"(%29) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %32 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.sel"(%31, %32, %33) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %35 to [%36 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %37 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.add"(%37) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %40 = neura.load_indexed [%39 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.icmp"(%41) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %44 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %45 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.sel"(%43, %44, %45) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%38) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %47 to [%48 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.add"(%49) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.icmp"(%53) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %56 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.sel"(%55, %56, %57) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%50) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %59 to [%60 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %62 = "neura.add"(%61) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = neura.load_indexed [%63 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.icmp"(%65) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %68 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.sel"(%67, %68, %69) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%62) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %71 to [%72 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.add"(%73) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.icmp"(%77) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %80 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.sel"(%79, %80, %81) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%74) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %83 to [%84 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %85 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.add"(%85) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = neura.load_indexed [%87 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %90 = "neura.icmp"(%89) <{cmpType = "sgt"}> {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %92 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.sel"(%91, %92, %93) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%86) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %95 to [%96 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<4096xi32>) writes(%arg3 : memref<4096xi32>)
    }
    return
  }
  func.func @conv2d_2(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 576 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = neura.load_indexed [%6, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.mul"(%11, %12) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%13) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.add"(%14, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %17 to [%18 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = "neura.add"(%19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %21 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%23, %24 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%27) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.mul"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %33 = "neura.add"(%31, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %34 to [%35 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %36 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %37 = "neura.add"(%36) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %39 = neura.load_indexed [%38 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %40 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = neura.load_indexed [%40, %41 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.mul"(%45, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.add"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %51 to [%52 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = "neura.add"(%53) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %55 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = neura.load_indexed [%55 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%57, %58 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%60 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%62, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.add"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %68 to [%69 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %70 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.add"(%70) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%74, %75 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%77 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.mul"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.add"(%82, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %85 to [%86 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %87 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %88 = "neura.add"(%87) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = neura.load_indexed [%89 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %91 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%91, %92 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%94 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.mul"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.add"(%99, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %102 to [%103 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %104 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %105 = "neura.add"(%104) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = neura.load_indexed [%106 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %108 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = neura.load_indexed [%108, %109 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%111 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.mul"(%113, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.add"(%116, %117) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %119 to [%120 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %121 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.add"(%121) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%123 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %125 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = neura.load_indexed [%125, %126 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return
  }
  func.func @add_residual(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>, %arg2: memref<4096xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096xi32>, %arg5: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 8 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %9 to [%10 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.add"(%11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.data_mov"(%12) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = neura.load_indexed [%15 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %17 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.add"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%12) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%21 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.add"(%22) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%23) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%26 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%27) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.add"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%23) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %31 to [%32 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %33 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.add"(%33) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %37 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %39 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.add"(%39, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.add"(%44) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %49 = neura.load_indexed [%48 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %50 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.add"(%50, %51) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %53 to [%54 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %55 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.add"(%55) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = neura.load_indexed [%59 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.add"(%61, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %64 to [%65 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.add"(%66) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %70 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = neura.load_indexed [%70 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %72 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%72, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %75 to [%76 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.add"(%77) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = neura.load_indexed [%79 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.data_mov"(%78) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = neura.load_indexed [%81 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %83 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%82) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.add"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%78) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %86 to [%87 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<4096xi32>, memref<4096xi32>) writes(%arg5 : memref<4096xi32>)
    }
    return
  }
}

