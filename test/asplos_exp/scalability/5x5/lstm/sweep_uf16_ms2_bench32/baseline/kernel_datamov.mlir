module {
  func.func @i_gate_x(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @f_gate_x(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @o_gate_x(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @g_gate_x(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @i_gate_h(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @f_gate_h(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @o_gate_h(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @g_gate_h(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>):
        %2 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %3 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%8, %9 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %23 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = neura.load_indexed [%25, %26 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %40 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %41 = neura.load_indexed [%40 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%42, %43 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %57 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%59, %60 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = neura.load_indexed [%76, %77 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %79 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %91 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %95 = neura.load_indexed [%93, %94 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %108 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %109 = neura.load_indexed [%108 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = neura.load_indexed [%110, %111 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%127, %128 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %132 = "neura.mul"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.add"(%133, %134) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %136 to [%137 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %139 = "neura.add"(%138) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %140 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = neura.load_indexed [%140 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %142 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%144, %145 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.add"(%150, %151) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %153 to [%154 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %155 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.add"(%155) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %158 = neura.load_indexed [%157 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %159 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %160 = neura.load_indexed [%159 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %161 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %163 = neura.load_indexed [%161, %162 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %164 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.mul"(%164, %165) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %168 = "neura.data_mov"(%166) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %169 = "neura.add"(%167, %168) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %170 to [%171 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = "neura.add"(%172) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %174 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %175 = neura.load_indexed [%174 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %176 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %177 = neura.load_indexed [%176 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %178 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%178, %179 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%177) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = neura.load_indexed [%195, %196 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %198 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %199 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %200 = "neura.mul"(%198, %199) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %201 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %202 = "neura.data_mov"(%200) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.add"(%201, %202) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %204 to [%205 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %206 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %207 = "neura.add"(%206) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %208 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %209 = neura.load_indexed [%208 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = neura.load_indexed [%210 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %212 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %214 = neura.load_indexed [%212, %213 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %215 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %216 = "neura.data_mov"(%214) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.mul"(%215, %216) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.data_mov"(%209) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.add"(%218, %219) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %221 to [%222 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %224 = "neura.add"(%223) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %225 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %226 = neura.load_indexed [%225 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %227 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %228 = neura.load_indexed [%227 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %229 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %231 = neura.load_indexed [%229, %230 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %232 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %233 = "neura.data_mov"(%231) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %234 = "neura.mul"(%232, %233) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %235 = "neura.data_mov"(%226) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %236 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %237 = "neura.add"(%235, %236) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%237) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %238 to [%239 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %240 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = "neura.add"(%240) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %242 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %245 = neura.load_indexed [%244 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %246 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %248 = neura.load_indexed [%246, %247 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %249 = "neura.data_mov"(%245) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%248) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.mul"(%249, %250) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %252 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %253 = "neura.data_mov"(%251) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %254 = "neura.add"(%252, %253) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %255 = "neura.data_mov"(%254) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %256 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %255 to [%256 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %257 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %258 = "neura.add"(%257) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %259 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %260 = neura.load_indexed [%259 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %261 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %265 = neura.load_indexed [%263, %264 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %266 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.data_mov"(%265) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.mul"(%266, %267) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.data_mov"(%268) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.add"(%269, %270) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%271) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %273 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %272 to [%273 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg6 : memref<32xi32>)
    }
    return
  }
  func.func @cell_update(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32xi32>, %arg3: memref<32xi32>, %arg4: memref<32xi32>) {
    %dependency_read_out:4, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2, %arg3 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) dependency_write_in(%arg4 : memref<32xi32>) [original_read_memrefs(%arg0, %arg1, %arg2, %arg3 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg4 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg5: memref<32xi32>, %arg6: memref<32xi32>, %arg7: memref<32xi32>, %arg8: memref<32xi32>, %arg9: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg5, %arg6, %arg7, %arg8, %arg9 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg10: memref<32xi32>, %arg11: memref<32xi32>, %arg12: memref<32xi32>, %arg13: memref<32xi32>, %arg14: memref<32xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%10) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.mul"(%13, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.data_mov"(%15) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.add"(%16, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %19 to [%20 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %22 = "neura.add"(%21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = neura.load_indexed [%23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = neura.load_indexed [%25 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %27 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.data_mov"(%26) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.mul"(%27, %28) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%30 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %34 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%29) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.add"(%37, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%22) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %40 to [%41 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.add"(%42) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %54 = neura.load_indexed [%53 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %55 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %57 = "neura.mul"(%55, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %58 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %59 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.add"(%58, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %61 to [%62 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %63 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %64 = "neura.add"(%63) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %65 = "neura.data_mov"(%64) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = neura.load_indexed [%65 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %67 = "neura.data_mov"(%64) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %69 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.mul"(%69, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%64) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%64) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.mul"(%76, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.add"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%64) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %82 to [%83 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.add"(%84) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = neura.load_indexed [%86 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %88 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.mul"(%90, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = neura.load_indexed [%93 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %95 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %96 = neura.load_indexed [%95 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %97 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %99 = "neura.mul"(%97, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %100 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %101 = "neura.data_mov"(%99) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.add"(%100, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %103 to [%104 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %105 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.add"(%105) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = neura.load_indexed [%107 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %109 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %110 = neura.load_indexed [%109 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %111 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %113 = "neura.mul"(%111, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %114 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = neura.load_indexed [%114 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %116 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = neura.load_indexed [%116 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %118 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.mul"(%118, %119) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.add"(%121, %122) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %124 to [%125 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %126 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.add"(%126) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %132 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.mul"(%132, %133) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %136 = neura.load_indexed [%135 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %137 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %138 = neura.load_indexed [%137 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %139 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %141 = "neura.mul"(%139, %140) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %142 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %143 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %144 = "neura.add"(%142, %143) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %145 = "neura.data_mov"(%144) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %146 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %145 to [%146 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %148 = "neura.add"(%147) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %149 = "neura.data_mov"(%148) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %150 = neura.load_indexed [%149 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %151 = "neura.data_mov"(%148) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %152 = neura.load_indexed [%151 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %153 = "neura.data_mov"(%150) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %154 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %155 = "neura.mul"(%153, %154) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %156 = "neura.data_mov"(%148) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%156 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%148) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = neura.load_indexed [%158 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %160 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.mul"(%160, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.data_mov"(%155) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%162) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.add"(%163, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%148) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %166 to [%167 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %168 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.add"(%168) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = neura.load_indexed [%170 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = neura.load_indexed [%172 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %174 = "neura.data_mov"(%171) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %176 = "neura.mul"(%174, %175) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %178 = neura.load_indexed [%177 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %179 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %180 = neura.load_indexed [%179 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %181 = "neura.data_mov"(%178) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %182 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %184 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %186 = "neura.add"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %187 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %188 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %187 to [%188 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %189 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %190 = "neura.add"(%189) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %191 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %192 = neura.load_indexed [%191 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %193 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %194 = neura.load_indexed [%193 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %195 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %196 = "neura.data_mov"(%194) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %197 = "neura.mul"(%195, %196) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %198 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %199 = neura.load_indexed [%198 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %200 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = neura.load_indexed [%200 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %202 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.data_mov"(%201) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.mul"(%202, %203) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%197) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %206 = "neura.data_mov"(%204) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %207 = "neura.add"(%205, %206) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %208 = "neura.data_mov"(%207) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %208 to [%209 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = "neura.add"(%210) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %212 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = neura.load_indexed [%212 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %214 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %215 = neura.load_indexed [%214 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %216 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.data_mov"(%215) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.mul"(%216, %217) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %220 = neura.load_indexed [%219 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %221 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %222 = neura.load_indexed [%221 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %223 = "neura.data_mov"(%220) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %224 = "neura.data_mov"(%222) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %225 = "neura.mul"(%223, %224) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %226 = "neura.data_mov"(%218) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %227 = "neura.data_mov"(%225) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %228 = "neura.add"(%226, %227) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %229 = "neura.data_mov"(%228) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %230 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %229 to [%230 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %231 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %232 = "neura.add"(%231) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %233 = "neura.data_mov"(%232) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %234 = neura.load_indexed [%233 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %235 = "neura.data_mov"(%232) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %236 = neura.load_indexed [%235 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %237 = "neura.data_mov"(%234) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %238 = "neura.data_mov"(%236) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %239 = "neura.mul"(%237, %238) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %240 = "neura.data_mov"(%232) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %241 = neura.load_indexed [%240 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %242 = "neura.data_mov"(%232) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %243 = neura.load_indexed [%242 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %244 = "neura.data_mov"(%241) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %245 = "neura.data_mov"(%243) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %246 = "neura.mul"(%244, %245) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %247 = "neura.data_mov"(%239) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %248 = "neura.data_mov"(%246) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %249 = "neura.add"(%247, %248) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %250 = "neura.data_mov"(%249) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %251 = "neura.data_mov"(%232) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %250 to [%251 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %252 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %253 = "neura.add"(%252) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %254 = "neura.data_mov"(%253) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %255 = neura.load_indexed [%254 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %256 = "neura.data_mov"(%253) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %257 = neura.load_indexed [%256 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %258 = "neura.data_mov"(%255) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %259 = "neura.data_mov"(%257) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %260 = "neura.mul"(%258, %259) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %261 = "neura.data_mov"(%253) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %262 = neura.load_indexed [%261 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %263 = "neura.data_mov"(%253) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = neura.load_indexed [%263 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %265 = "neura.data_mov"(%262) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %266 = "neura.data_mov"(%264) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %267 = "neura.mul"(%265, %266) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %268 = "neura.data_mov"(%260) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %269 = "neura.data_mov"(%267) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %270 = "neura.add"(%268, %269) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %271 = "neura.data_mov"(%270) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %272 = "neura.data_mov"(%253) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %271 to [%272 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %273 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %274 = "neura.add"(%273) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %275 = "neura.data_mov"(%274) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %276 = neura.load_indexed [%275 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %277 = "neura.data_mov"(%274) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %278 = neura.load_indexed [%277 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %279 = "neura.data_mov"(%276) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %280 = "neura.data_mov"(%278) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %281 = "neura.mul"(%279, %280) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %282 = "neura.data_mov"(%274) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %283 = neura.load_indexed [%282 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %284 = "neura.data_mov"(%274) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %285 = neura.load_indexed [%284 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %286 = "neura.data_mov"(%283) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %287 = "neura.data_mov"(%285) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %288 = "neura.mul"(%286, %287) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %289 = "neura.data_mov"(%281) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %290 = "neura.data_mov"(%288) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %291 = "neura.add"(%289, %290) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %292 = "neura.data_mov"(%291) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %293 = "neura.data_mov"(%274) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %292 to [%293 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %294 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %295 = "neura.add"(%294) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %296 = "neura.data_mov"(%295) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %297 = neura.load_indexed [%296 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %298 = "neura.data_mov"(%295) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %299 = neura.load_indexed [%298 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %300 = "neura.data_mov"(%297) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %301 = "neura.data_mov"(%299) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %302 = "neura.mul"(%300, %301) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %303 = "neura.data_mov"(%295) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %304 = neura.load_indexed [%303 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %305 = "neura.data_mov"(%295) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %306 = neura.load_indexed [%305 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %307 = "neura.data_mov"(%304) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %308 = "neura.data_mov"(%306) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %309 = "neura.mul"(%307, %308) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %310 = "neura.data_mov"(%302) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %311 = "neura.data_mov"(%309) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %312 = "neura.add"(%310, %311) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %313 = "neura.data_mov"(%312) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %314 = "neura.data_mov"(%295) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %313 to [%314 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        %315 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %316 = "neura.add"(%315) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %317 = "neura.data_mov"(%316) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %318 = neura.load_indexed [%317 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %319 = "neura.data_mov"(%316) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %320 = neura.load_indexed [%319 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %321 = "neura.data_mov"(%318) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %322 = "neura.data_mov"(%320) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %323 = "neura.mul"(%321, %322) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %324 = "neura.data_mov"(%316) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %325 = neura.load_indexed [%324 : !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
        %326 = "neura.data_mov"(%316) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %327 = neura.load_indexed [%326 : !neura.data<index, i1>]  {lhs_value = "%input3"} : !neura.data<i32, i1>
        %328 = "neura.data_mov"(%325) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %329 = "neura.data_mov"(%327) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %330 = "neura.mul"(%328, %329) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %331 = "neura.data_mov"(%323) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %332 = "neura.data_mov"(%330) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %333 = "neura.add"(%331, %332) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %334 = "neura.data_mov"(%333) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %335 = "neura.data_mov"(%316) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %334 to [%335 : !neura.data<index, i1>]  {rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg5, %arg6, %arg7, %arg8 : memref<32xi32>, memref<32xi32>, memref<32xi32>, memref<32xi32>) writes(%arg9 : memref<32xi32>)
    }
    return
  }
  func.func @output_gate(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32xi32>) {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<32xi32>, memref<32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg0, %arg1 : memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg3: memref<32xi32>, %arg4: memref<32xi32>, %arg5: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg6: memref<32xi32>, %arg7: memref<32xi32>, %arg8: memref<32xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.mul"(%9, %10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %12 to [%13 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %14 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %15 = "neura.add"(%14) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %17 = neura.load_indexed [%16 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.mul"(%20, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %25 = "neura.mul"(%23, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%15) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %26 to [%27 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %28 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %29 = "neura.add"(%28) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %30 = "neura.data_mov"(%29) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %31 = neura.load_indexed [%30 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.data_mov"(%29) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %33 = neura.load_indexed [%32 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %34 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %35 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %37 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.mul"(%37, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.data_mov"(%29) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %40 to [%41 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %42 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.add"(%42) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = neura.load_indexed [%44 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %46 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.mul"(%51, %52) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%43) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %54 to [%55 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %56 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.add"(%56) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.data_mov"(%57) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = neura.load_indexed [%58 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %60 = "neura.data_mov"(%57) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %61 = neura.load_indexed [%60 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.mul"(%62, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %66 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %67 = "neura.mul"(%65, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %69 = "neura.data_mov"(%57) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %68 to [%69 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %70 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %71 = "neura.add"(%70) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %72 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %73 = neura.load_indexed [%72 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %74 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = neura.load_indexed [%74 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %77 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.mul"(%76, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%73) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %81 = "neura.mul"(%79, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %82 to [%83 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %84 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %85 = "neura.add"(%84) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %87 = neura.load_indexed [%86 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %88 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = neura.load_indexed [%88 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %91 = "neura.data_mov"(%89) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %92 = "neura.mul"(%90, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.mul"(%93, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%85) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %96 to [%97 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %98 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.add"(%98) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.data_mov"(%99) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = neura.load_indexed [%100 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %102 = "neura.data_mov"(%99) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %103 = neura.load_indexed [%102 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.mul"(%104, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.mul"(%107, %108) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%99) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %110 to [%111 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %112 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %113 = "neura.add"(%112) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.data_mov"(%113) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = neura.load_indexed [%114 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %116 = "neura.data_mov"(%113) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %117 = neura.load_indexed [%116 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %118 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.mul"(%118, %119) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %121 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %122 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %123 = "neura.mul"(%121, %122) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %125 = "neura.data_mov"(%113) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %124 to [%125 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %126 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %127 = "neura.add"(%126) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %129 = neura.load_indexed [%128 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %130 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %131 = neura.load_indexed [%130 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %132 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %133 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %134 = "neura.mul"(%132, %133) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %135 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %136 = "neura.data_mov"(%134) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.mul"(%135, %136) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %138 = "neura.data_mov"(%137) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%127) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %138 to [%139 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %140 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %141 = "neura.add"(%140) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %142 = "neura.data_mov"(%141) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %143 = neura.load_indexed [%142 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %144 = "neura.data_mov"(%141) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = neura.load_indexed [%144 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %147 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.mul"(%146, %147) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.mul"(%149, %150) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%141) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %152 to [%153 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %154 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.add"(%154) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%156 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = neura.load_indexed [%158 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %160 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.mul"(%160, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%162) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %165 = "neura.mul"(%163, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %167 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %166 to [%167 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %168 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %169 = "neura.add"(%168) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %170 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %171 = neura.load_indexed [%170 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %172 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %173 = neura.load_indexed [%172 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %174 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %176 = "neura.mul"(%174, %175) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %177 = "neura.data_mov"(%171) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %178 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %179 = "neura.mul"(%177, %178) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %181 = "neura.data_mov"(%169) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %180 to [%181 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %182 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %183 = "neura.add"(%182) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %184 = "neura.data_mov"(%183) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %185 = neura.load_indexed [%184 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %186 = "neura.data_mov"(%183) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %187 = neura.load_indexed [%186 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %188 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %189 = "neura.data_mov"(%187) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %190 = "neura.mul"(%188, %189) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %191 = "neura.data_mov"(%185) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %192 = "neura.data_mov"(%190) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %193 = "neura.mul"(%191, %192) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %195 = "neura.data_mov"(%183) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %194 to [%195 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %196 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %197 = "neura.add"(%196) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %198 = "neura.data_mov"(%197) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %199 = neura.load_indexed [%198 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %200 = "neura.data_mov"(%197) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %201 = neura.load_indexed [%200 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %202 = "neura.data_mov"(%201) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %203 = "neura.data_mov"(%201) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %204 = "neura.mul"(%202, %203) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %205 = "neura.data_mov"(%199) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %206 = "neura.data_mov"(%204) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %207 = "neura.mul"(%205, %206) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %208 = "neura.data_mov"(%207) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %209 = "neura.data_mov"(%197) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %208 to [%209 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %210 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %211 = "neura.add"(%210) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %212 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = neura.load_indexed [%212 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %214 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %215 = neura.load_indexed [%214 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %216 = "neura.data_mov"(%215) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %217 = "neura.data_mov"(%215) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %218 = "neura.mul"(%216, %217) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %219 = "neura.data_mov"(%213) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %220 = "neura.data_mov"(%218) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %221 = "neura.mul"(%219, %220) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %222 = "neura.data_mov"(%221) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %223 = "neura.data_mov"(%211) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %222 to [%223 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<32xi32>, memref<32xi32>) writes(%arg5 : memref<32xi32>)
    }
    return
  }
}

